const hre = require('hardhat')

async function main(){
  const carbon = await hre.ethers.getContractFactory("Carbon")
  const contract = await carbon.deploy()
  await contract.waitForDeployment()
  console.log("Address of contract", contract.target )
}

main().catch((error) => {
    console.log(error)
    process.exitCode=1
} )