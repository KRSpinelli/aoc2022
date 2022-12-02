const { expect } = require("chai");

describe("Day2 contract", function () {
  it("Deployment should assign the total supply of tokens to the owner", async function () {
    const [owner] = await ethers.getSigners();

    const Day2 = await ethers.getContractFactory("Day2");

    const day2 = await Day2.deploy();

    const result = await day2.main("");
    
    expect(result).to.equal(15);
  });
});