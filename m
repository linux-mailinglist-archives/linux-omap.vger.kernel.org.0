Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E06AB5601A1
	for <lists+linux-omap@lfdr.de>; Wed, 29 Jun 2022 15:45:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231501AbiF2Nof (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 29 Jun 2022 09:44:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231726AbiF2NoU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 29 Jun 2022 09:44:20 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0678312A94
        for <linux-omap@vger.kernel.org>; Wed, 29 Jun 2022 06:44:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id ADC9CB824AB
        for <linux-omap@vger.kernel.org>; Wed, 29 Jun 2022 13:44:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D68FC341CB;
        Wed, 29 Jun 2022 13:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656510255;
        bh=fUB+IOSpVTGZ/j6pLA5eR/ugGco5MKiiPXFEt4eqrrk=;
        h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
        b=Oj33v0D+HpvOBW1CHjE1hjBGdNxyFBHp6mOWw8zyqUeU3olKRA1W/iMel1YTZcdKY
         EAnM0aL4ahbWxi9+SnW/tf5tNj5y+BTO4YvGGQZzgAyJXnhW7L+UDR02u4RXrMCxkt
         lxzWNDOahTxH2j3jI9AJ1BLCeIZo8/RHkCnaAA6nc+1v2balS0JBOlNwHe+a7IcNHb
         7HP95qaQeHqPSvlNrHtel0ow7yrMpumU5cvU0OALULegLSijHc39nMRgH9hzZYNT/Q
         8Wjlwo7a7frjkCJhDJoMO34fyctNwUT8ZSGcmdRf/NLWBd+xz9bdTBUj+ajm2G5dV4
         6Bsc2fIN3O6dw==
Message-ID: <feff53c6-a38c-1592-b3ef-1ff236da17f9@kernel.org>
Date:   Wed, 29 Jun 2022 16:44:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: raw/omap2: erasing issue
Content-Language: en-US
From:   Roger Quadros <rogerq@kernel.org>
To:     Yegor Yefremov <yegorslists@googlemail.com>
Cc:     linux-mtd@lists.infradead.org,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        miquel.raynal@bootlin.com
References: <CAGm1_ktXBp-sz3Dud_G0iqOG=vA=Xp-bj-icwNLVgq-AMqKO7A@mail.gmail.com>
 <72686231-c372-a4fe-347e-39470790fa65@kernel.org>
 <CAGm1_kvRuWY7t2d_BtuSLGEL1u4njRqha=D0f7eN9F5XG8GrLQ@mail.gmail.com>
 <CAGm1_kuucv71AdPkSW8Eog2T9rZRA3uiL4+ok-aWCVsj-z2eew@mail.gmail.com>
 <5a36197d-7ed5-c06a-0a7e-73b808526dcd@kernel.org>
In-Reply-To: <5a36197d-7ed5-c06a-0a7e-73b808526dcd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Yegor,

On 29/06/2022 14:33, Roger Quadros wrote:
> Hi Yegor,
> 
> On 28/06/2022 14:59, Yegor Yefremov wrote:
>> On Tue, Jun 28, 2022 at 1:57 PM Yegor Yefremov
>> <yegorslists@googlemail.com> wrote:
>>>
>>> Hi Roger,
>>>
>>> On Tue, Jun 28, 2022 at 1:44 PM Roger Quadros <rogerq@kernel.org> wrote:
>>>>
>>>> Hi Yegor,
>>>>
>>>> On 28/06/2022 13:48, Yegor Yefremov wrote:
>>>>> Since linux 5.17 I get the following issue when doing ubiformat:
>>>>>
>>>>> # ubiformat -y /dev/mtd5
>>>>> ubiformat: mtd5 (nand), size 265945088 bytes (253.6 MiB), 2029
>>>>> eraseblocks of 131072 bytes (128.0 KiB), min. I/O size 2048 bytes
>>>>> libscan: scanning eraseblock 1097 -- 54 % complete  eth1 timed out to bring up
>>>>> libscan: scanning eraseblock 2028 -- 100 % complete
>>>>> ubiformat: 2001 eraseblocks have valid erase counter, mean value is 9
>>>>> ubiformat: 2 eraseblocks are supposedly empty
>>>>> ubiformat: 26 bad eraseblocks found, numbers: 3, 4, 5, 6, 8, 9, 10,
>>>>> 11, 13, 14, 15, 16, 17, 18, 19, 20, 22, 23, 24, 25, 26, 27, 29, 30,
>>>>> 31, 32
>>>>
>>>> I'm guessing these bad blocks recently added due to the offending patch?
>>>
>>> Yes.
>>>
>>>>> ubiformat: formatting eras[   33.644323] nand: nand_erase_nand:
>>>>> attempt to erase a bad block at page 0x00000d40
>>>>> ubiformat: formatting eraseblock 28[   33.658809] nand:
>>>>> nand_erase_nand: attempt to erase a bad block at page 0x00000d80
>>>>> ubiformat: formatting eraseblock 29 --  1 % [   33.674531] nand:
>>>>> nand_erase_nand: attempt to erase a bad block at page 0x00000dc0
>>>>> ubiformat: formatting eraseblock 30 --  1 % complete [   33.684508]
>>>>> nand: nand_erase_nand: attempt to erase a bad block at page 0x00000e00
>>>>> ubiformat: formatting eraseblock 34 --  1 % complete  libmtd: error!:
>>>>> MEMERASE64 ioctl failed for eraseblock 34 (mtd5)
>>>>>         error 5 (Input/output error)
>>>>>
>>>>> ubiformat: error!: failed to erase eraseblock 34
>>>>>            error 5 (Input/output error)
>>>>> ubiformat: marking block 34 bad
>>>>> ubiformat: formatting eraseblock 35 --  1 % complete  libmtd: error!:
>>>>> MEMERASE64 ioctl failed for eraseblock 35 (mtd5)
>>>>>         error 5 (Input/output error)
>>>>>
>>>>> ubiformat: error!: failed to erase eraseblock 35
>>>>>            error 5 (Input/output error)
>>>>> ubiformat: marking block 35 bad
>>>>> ubiformat: formatting eraseblock 36 --  1 % complete  libmtd: error!:
>>>>> MEMERASE64 ioctl failed for eraseblock 36 (mtd5)
>>>>>         error 5 (Input/output error)
>>>>>
>>>>> ubiformat: error!: failed to erase eraseblock 36
>>>>>            error 5 (Input/output error)
>>>>> ubiformat: marking block 36 bad
>>>>> ubiformat: formatting eraseblock 37 --  1 % complete  libmtd: error!:
>>>>> MEMERASE64 ioctl failed for eraseblock 37 (mtd5)
>>>>>         error 5 (Input/output error)
>>>>>
>>>>> ubiformat: error!: failed to erase eraseblock 37
>>>>>            error 5 (Input/output error)
>>>>> ubiformat: marking block 37 bad
>>>>>
>>>>> ubiformat: error!: consecutive bad blocks exceed limit: 4, bad flash?
>>>>> # [   36.322563] vwl1271: disabling
>>>>>
>>>>> git bisect pointed to the following commit:
>>>>>
>>>>> a9e849efca4f9c7732ea4a81f13ec96208994b22 is the first bad commit
>>>>> commit a9e849efca4f9c7732ea4a81f13ec96208994b22
>>>>> Author: Roger Quadros <rogerq@kernel.org>
>>>>> Date:   Thu Dec 9 11:04:55 2021 +0200
>>>>>
>>>>>     mtd: rawnand: omap2: move to exec_op interface
>>>>>
>>>>>     Stop using legacy interface and move to the exec_op interface.
>>>>>
>>>>>     Signed-off-by: Roger Quadros <rogerq@kernel.org>
>>>>>     Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>>>>>     Link: https://lore.kernel.org/linux-mtd/20211209090458.24830-4-rogerq@kernel.org
>>>>>
>>>>> :040000 040000 2341051b8aa8e6b554b8a44d2934f76d1aa460c4
>>>>> c1727080ff16c403f4ad5ed840acc90127b632f8 M      drivers
>>>>>
>>>>> Info to my NAND flash:
>>>>>
>>>>> [    5.695760] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xda
>>>>> [    5.702193] nand: Micron MT29F2G08ABAEAWP
>>>>> [    5.706356] nand: 256 MiB, SLC, erase size: 128 KiB, page size:
>>>>> 2048, OOB size: 64
>>>>> [    5.714204] nand: using OMAP_ECC_BCH8_CODE_HW ECC scheme
>>>>> [    5.719673] 6 cmdlinepart partitions found on MTD device omap2-nand.0
>>>>> [    5.726232] Creating 6 MTD partitions on "omap2-nand.0":
>>>>> [    5.731594] 0x000000000000-0x000000020000 : "SPL"
>>>>> [    5.737788] mtdblock: MTD device 'SPL' is NAND, please consider
>>>>> using UBI block devices instead.
>>>>> [    5.750113] 0x000000020000-0x000000040000 : "SPL.backup1"
>>>>> [    5.756916] mtdblock: MTD device 'SPL.backup1' is NAND, please
>>>>> consider using UBI block devices instead.
>>>>> [    5.769870] 0x000000040000-0x000000060000 : "SPL.backup2"
>>>>> [    5.776695] mtdblock: MTD device 'SPL.backup2' is NAND, please
>>>>> consider using UBI block devices instead.
>>>>> [    5.789559] 0x000000060000-0x000000080000 : "SPL.backup3"
>>>>> [    5.796423] mtdblock: MTD device 'SPL.backup3' is NAND, please
>>>>> consider using UBI block devices instead.
>>>>> [    5.809341] 0x000000080000-0x000000260000 : "u-boot"
>>>>> [    5.816652] mtdblock: MTD device 'u-boot' is NAND, please consider
>>>>> using UBI block devices instead.
>>>>> [    5.829189] 0x000000260000-0x000010000000 : "UBI"
>>>>> [    5.971508] mtdblock: MTD device 'UBI' is NAND, please consider
>>>>> using UBI block devices instead.
>>>>>
>>>>
>>>> What platform are you on?
>>>> I do remember testing this on omap3-beagle but it does not use BCH8 ECC scheme.
>>>
>>> I am on am335x [1]
>>>
>>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/am335x-baltos-ir5221.dts?h=v5.19-rc4
>>
>> NAND node definition [1]:
>>
>> &gpmc {
>> pinctrl-names = "default";
>> pinctrl-0 = <&nandflash_pins_s0>;
>> ranges = <0 0 0x08000000 0x10000000>; /* CS0: NAND */
>> status = "okay";
>>
>> nand@0,0 {
>> compatible = "ti,omap2-nand";
>> reg = <0 0 4>; /* CS0, offset 0, IO size 4 */
>> interrupt-parent = <&gpmc>;
>> interrupts = <0 IRQ_TYPE_NONE>, /* fifoevent */
>>     <1 IRQ_TYPE_NONE>; /* termcount */
>> rb-gpios = <&gpmc 0 GPIO_ACTIVE_HIGH>; /* gpmc_wait0 */
>> nand-bus-width = <8>;
>> ti,nand-ecc-opt = "bch8";
>> ti,nand-xfer-type = "polled";
> 
> Could you please change this to "prefetch-polled" and see if it fixes the issue?
> 

I tried to set ti,nand-xfer-type to "polled" on beagle-c4 board and could not reproduce the issue
I will need your help please to debug this issue.

Could you please apply the below patch on top of commit a9e849efca4f9c7732ea4a81f13ec96208994b22
and send me the full kernel log and output of ubiformat command?

Thanks!

cheers,
-roger

From 2775aca0411755c57f90e9c8a0061853275083b4 Mon Sep 17 00:00:00 2001
From: Roger Quadros <rogerq@kernel.org>
Date: Wed, 29 Jun 2022 16:40:51 +0300
Subject: [PATCH] debug: omap-nand: erase operations

add some debug prints in erase operation failure path

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/mtd/nand/raw/nand_base.c | 12 ++++++++++++
 drivers/mtd/nand/raw/omap2.c     |  3 +++
 2 files changed, 15 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 113a2e9f43b1..3b1a599bcec5 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -1848,24 +1848,36 @@ int nand_erase_op(struct nand_chip *chip, unsigned int eraseblock)
 
 		ret = nand_exec_op(chip, &op);
 		if (ret)
+		{
+			pr_err("%s: exec_op failed %d\n", __func__, ret);
 			return ret;
+		}
 
 		ret = nand_status_op(chip, &status);
 		if (ret)
+		{
+			pr_err("%s: status_op failed %d\n", __func__, ret);
 			return ret;
+		}
 	} else {
 		chip->legacy.cmdfunc(chip, NAND_CMD_ERASE1, -1, page);
 		chip->legacy.cmdfunc(chip, NAND_CMD_ERASE2, -1, -1);
 
 		ret = chip->legacy.waitfunc(chip);
 		if (ret < 0)
+		{
+			pr_err("%s: legacy wait failed %d\n", __func__, ret);
 			return ret;
+		}
 
 		status = ret;
 	}
 
 	if (status & NAND_STATUS_FAIL)
+	{
+		pr_err("%s: NAND_STATUS fail\n", __func__);
 		return -EIO;
+	}
 
 	return 0;
 }
diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index 224c91282c87..5b1297333bed 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -2130,7 +2130,10 @@ static int omap_nand_exec_instr(struct nand_chip *chip,
 			nand_gpio_waitrdy(chip, info->ready_gpiod, instr->ctx.waitrdy.timeout_ms) :
 			nand_soft_waitrdy(chip, instr->ctx.waitrdy.timeout_ms);
 		if (ret)
+		{
+			dev_info(&info->pdev->dev, "%s: wait timeout %d, %px\n", __func__, ret, info->ready_gpiod);
 			return ret;
+		}
 		break;
 	}
 
-- 
2.17.1


