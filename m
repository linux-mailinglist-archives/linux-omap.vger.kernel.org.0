Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B313255DB25
	for <lists+linux-omap@lfdr.de>; Tue, 28 Jun 2022 15:24:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345125AbiF1LrG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 Jun 2022 07:47:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345140AbiF1Lqx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 Jun 2022 07:46:53 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C024344EE
        for <linux-omap@vger.kernel.org>; Tue, 28 Jun 2022 04:44:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 18717CE1E0E
        for <linux-omap@vger.kernel.org>; Tue, 28 Jun 2022 11:44:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12EE9C3411D;
        Tue, 28 Jun 2022 11:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656416695;
        bh=tkn/x7mAlpHdjLr2Gtx9mB2/XObG6QonIO0VzrwKPsA=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=fhfjsvvz/Wem+sRfzqIa7kvoEX/7O9yyiyqdAXYaZkFio+GNwvn8RsI+uyqL7Fv3J
         CzxSGhMCqmBo8HkrYxsaxJXm5Lie871sigZIiNTb89aQef6jzFJ0o5H/LFWKgJ6jBM
         ISA+E83RGsAIlyufZAefTicOl3VAnAuMRHH7+JoEWF5Oyvgm4YefQ0HvF/jzaXbxgw
         Q3d0M3xfkgFnt9CyuKGdga0c/7KymwJtkk8PRIyUVLNqVCGGCxodZ/7ozvsrgKKflx
         C9xLIpX5EoN/HoDERssJd3JTA2d3UD/rsoXR/u0bOm0evKAavz5g3a4sVUJUZK1yPH
         5g9OZwtKU/raA==
Message-ID: <72686231-c372-a4fe-347e-39470790fa65@kernel.org>
Date:   Tue, 28 Jun 2022 14:44:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: raw/omap2: erasing issue
Content-Language: en-US
To:     Yegor Yefremov <yegorslists@googlemail.com>,
        linux-mtd@lists.infradead.org
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>, miquel.raynal@bootlin.com
References: <CAGm1_ktXBp-sz3Dud_G0iqOG=vA=Xp-bj-icwNLVgq-AMqKO7A@mail.gmail.com>
From:   Roger Quadros <rogerq@kernel.org>
In-Reply-To: <CAGm1_ktXBp-sz3Dud_G0iqOG=vA=Xp-bj-icwNLVgq-AMqKO7A@mail.gmail.com>
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

On 28/06/2022 13:48, Yegor Yefremov wrote:
> Since linux 5.17 I get the following issue when doing ubiformat:
> 
> # ubiformat -y /dev/mtd5
> ubiformat: mtd5 (nand), size 265945088 bytes (253.6 MiB), 2029
> eraseblocks of 131072 bytes (128.0 KiB), min. I/O size 2048 bytes
> libscan: scanning eraseblock 1097 -- 54 % complete  eth1 timed out to bring up
> libscan: scanning eraseblock 2028 -- 100 % complete
> ubiformat: 2001 eraseblocks have valid erase counter, mean value is 9
> ubiformat: 2 eraseblocks are supposedly empty
> ubiformat: 26 bad eraseblocks found, numbers: 3, 4, 5, 6, 8, 9, 10,
> 11, 13, 14, 15, 16, 17, 18, 19, 20, 22, 23, 24, 25, 26, 27, 29, 30,
> 31, 32

I'm guessing these bad blocks recently added due to the offending patch?

> ubiformat: formatting eras[   33.644323] nand: nand_erase_nand:
> attempt to erase a bad block at page 0x00000d40
> ubiformat: formatting eraseblock 28[   33.658809] nand:
> nand_erase_nand: attempt to erase a bad block at page 0x00000d80
> ubiformat: formatting eraseblock 29 --  1 % [   33.674531] nand:
> nand_erase_nand: attempt to erase a bad block at page 0x00000dc0
> ubiformat: formatting eraseblock 30 --  1 % complete [   33.684508]
> nand: nand_erase_nand: attempt to erase a bad block at page 0x00000e00
> ubiformat: formatting eraseblock 34 --  1 % complete  libmtd: error!:
> MEMERASE64 ioctl failed for eraseblock 34 (mtd5)
>         error 5 (Input/output error)
> 
> ubiformat: error!: failed to erase eraseblock 34
>            error 5 (Input/output error)
> ubiformat: marking block 34 bad
> ubiformat: formatting eraseblock 35 --  1 % complete  libmtd: error!:
> MEMERASE64 ioctl failed for eraseblock 35 (mtd5)
>         error 5 (Input/output error)
> 
> ubiformat: error!: failed to erase eraseblock 35
>            error 5 (Input/output error)
> ubiformat: marking block 35 bad
> ubiformat: formatting eraseblock 36 --  1 % complete  libmtd: error!:
> MEMERASE64 ioctl failed for eraseblock 36 (mtd5)
>         error 5 (Input/output error)
> 
> ubiformat: error!: failed to erase eraseblock 36
>            error 5 (Input/output error)
> ubiformat: marking block 36 bad
> ubiformat: formatting eraseblock 37 --  1 % complete  libmtd: error!:
> MEMERASE64 ioctl failed for eraseblock 37 (mtd5)
>         error 5 (Input/output error)
> 
> ubiformat: error!: failed to erase eraseblock 37
>            error 5 (Input/output error)
> ubiformat: marking block 37 bad
> 
> ubiformat: error!: consecutive bad blocks exceed limit: 4, bad flash?
> # [   36.322563] vwl1271: disabling
> 
> git bisect pointed to the following commit:
> 
> a9e849efca4f9c7732ea4a81f13ec96208994b22 is the first bad commit
> commit a9e849efca4f9c7732ea4a81f13ec96208994b22
> Author: Roger Quadros <rogerq@kernel.org>
> Date:   Thu Dec 9 11:04:55 2021 +0200
> 
>     mtd: rawnand: omap2: move to exec_op interface
> 
>     Stop using legacy interface and move to the exec_op interface.
> 
>     Signed-off-by: Roger Quadros <rogerq@kernel.org>
>     Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>     Link: https://lore.kernel.org/linux-mtd/20211209090458.24830-4-rogerq@kernel.org
> 
> :040000 040000 2341051b8aa8e6b554b8a44d2934f76d1aa460c4
> c1727080ff16c403f4ad5ed840acc90127b632f8 M      drivers
> 
> Info to my NAND flash:
> 
> [    5.695760] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xda
> [    5.702193] nand: Micron MT29F2G08ABAEAWP
> [    5.706356] nand: 256 MiB, SLC, erase size: 128 KiB, page size:
> 2048, OOB size: 64
> [    5.714204] nand: using OMAP_ECC_BCH8_CODE_HW ECC scheme
> [    5.719673] 6 cmdlinepart partitions found on MTD device omap2-nand.0
> [    5.726232] Creating 6 MTD partitions on "omap2-nand.0":
> [    5.731594] 0x000000000000-0x000000020000 : "SPL"
> [    5.737788] mtdblock: MTD device 'SPL' is NAND, please consider
> using UBI block devices instead.
> [    5.750113] 0x000000020000-0x000000040000 : "SPL.backup1"
> [    5.756916] mtdblock: MTD device 'SPL.backup1' is NAND, please
> consider using UBI block devices instead.
> [    5.769870] 0x000000040000-0x000000060000 : "SPL.backup2"
> [    5.776695] mtdblock: MTD device 'SPL.backup2' is NAND, please
> consider using UBI block devices instead.
> [    5.789559] 0x000000060000-0x000000080000 : "SPL.backup3"
> [    5.796423] mtdblock: MTD device 'SPL.backup3' is NAND, please
> consider using UBI block devices instead.
> [    5.809341] 0x000000080000-0x000000260000 : "u-boot"
> [    5.816652] mtdblock: MTD device 'u-boot' is NAND, please consider
> using UBI block devices instead.
> [    5.829189] 0x000000260000-0x000010000000 : "UBI"
> [    5.971508] mtdblock: MTD device 'UBI' is NAND, please consider
> using UBI block devices instead.
> 

What platform are you on?
I do remember testing this on omap3-beagle but it does not use BCH8 ECC scheme.

cheers,
-roger
