Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 900EB56027E
	for <lists+linux-omap@lfdr.de>; Wed, 29 Jun 2022 16:23:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbiF2OXs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 29 Jun 2022 10:23:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230143AbiF2OXr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 29 Jun 2022 10:23:47 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E0FD12A94
        for <linux-omap@vger.kernel.org>; Wed, 29 Jun 2022 07:23:46 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-2ef5380669cso149485427b3.9
        for <linux-omap@vger.kernel.org>; Wed, 29 Jun 2022 07:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CNaVzNHUPajw+QPGgsklhLVzrKiQweGShHumXOcUwR4=;
        b=p2d1sEDGE9lhuIHjFdZZe93eZDLE9isOlq+3SkJsGukw5YKnDj5RSAia5N4RwfW29w
         A+vWyt/6L+KycpVsskUfr3j2/2WDAoRsTtMke3jrMH9MsQJQ1xJQxAB1R5ReZOrGv3iK
         fob4CIqwHHHHV6SXjV5PZMpc32LmemodkIImWNJSbi/f0PSkekcwroUU+mRpZHCwvnIl
         lKae+TMGlOcnHjC0GZVMmzenrwqjqUYP5ILie+tzr2XvQwVARiwMtqfsxVyn7+XVgd+S
         +BuF20mtvU/XtrgoGEFfpuEuPKOYuvuSuq3/CU76RiCJAk7fGTUT61ElI9NGg2Y12vJp
         krVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CNaVzNHUPajw+QPGgsklhLVzrKiQweGShHumXOcUwR4=;
        b=A//LjMbJO+bKNRnAcVA57gL5yr6OPbTpVuffn1rmmOf28W59n6yv+00CD0IWsBWo/a
         YGWu9t4uO40x2aiYTxX1dMGnGAfaaFtgs5AkdbzEMZuU1nyeWU9MjdZxC7TRluWwQcpc
         SG/+XPVUH3ER5mHPjT24HVCOFqGqiNP2jOMq13UwJS98vlYxb+pULR1IP4nawD70k717
         xdX0jkcE+GyXQAtGpHTawwTMPTeuu1ATh1HtaMca6QMxzSX5Kve8biWGbxXGWkLNs9VA
         p6DcRdrQHhu+MNxCm6WD93aXpdO6pnwKHIj6O2jdBfApIYZDe64WbNLzXKpA5+Kv9LML
         /r1w==
X-Gm-Message-State: AJIora/wJEavWtrw4/fw6BaaGUNQpzgenaW23tS5Btdum1z0U2DHPLps
        CTJZ0cB7gQ1hruW234nggY74cVExZbuLhcyTqvg=
X-Google-Smtp-Source: AGRyM1sZ9X9CLQPZUGUSEoUFMZTqoysNZhJBl869QcYXvMRl/gZfoyz0NUT3kiad05wGgbRYf9S+jWVV+XAIZ6bfrr4=
X-Received: by 2002:a81:480d:0:b0:318:7c40:1e82 with SMTP id
 v13-20020a81480d000000b003187c401e82mr4247167ywa.80.1656512625211; Wed, 29
 Jun 2022 07:23:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm1_ktXBp-sz3Dud_G0iqOG=vA=Xp-bj-icwNLVgq-AMqKO7A@mail.gmail.com>
 <72686231-c372-a4fe-347e-39470790fa65@kernel.org> <CAGm1_kvRuWY7t2d_BtuSLGEL1u4njRqha=D0f7eN9F5XG8GrLQ@mail.gmail.com>
 <CAGm1_kuucv71AdPkSW8Eog2T9rZRA3uiL4+ok-aWCVsj-z2eew@mail.gmail.com>
 <5a36197d-7ed5-c06a-0a7e-73b808526dcd@kernel.org> <feff53c6-a38c-1592-b3ef-1ff236da17f9@kernel.org>
In-Reply-To: <feff53c6-a38c-1592-b3ef-1ff236da17f9@kernel.org>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Wed, 29 Jun 2022 16:23:34 +0200
Message-ID: <CAGm1_kvQ-NA4topLTu2hrQqx6picci8d+AeMVBtw44nJ7mYVow@mail.gmail.com>
Subject: Re: raw/omap2: erasing issue
To:     Roger Quadros <rogerq@kernel.org>
Cc:     linux-mtd@lists.infradead.org,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        miquel.raynal@bootlin.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Roger,

On Wed, Jun 29, 2022 at 3:44 PM Roger Quadros <rogerq@kernel.org> wrote:
>
> Hi Yegor,
>
> On 29/06/2022 14:33, Roger Quadros wrote:
> > Hi Yegor,
> >
> > On 28/06/2022 14:59, Yegor Yefremov wrote:
> >> On Tue, Jun 28, 2022 at 1:57 PM Yegor Yefremov
> >> <yegorslists@googlemail.com> wrote:
> >>>
> >>> Hi Roger,
> >>>
> >>> On Tue, Jun 28, 2022 at 1:44 PM Roger Quadros <rogerq@kernel.org> wrote:
> >>>>
> >>>> Hi Yegor,
> >>>>
> >>>> On 28/06/2022 13:48, Yegor Yefremov wrote:
> >>>>> Since linux 5.17 I get the following issue when doing ubiformat:
> >>>>>
> >>>>> # ubiformat -y /dev/mtd5
> >>>>> ubiformat: mtd5 (nand), size 265945088 bytes (253.6 MiB), 2029
> >>>>> eraseblocks of 131072 bytes (128.0 KiB), min. I/O size 2048 bytes
> >>>>> libscan: scanning eraseblock 1097 -- 54 % complete  eth1 timed out to bring up
> >>>>> libscan: scanning eraseblock 2028 -- 100 % complete
> >>>>> ubiformat: 2001 eraseblocks have valid erase counter, mean value is 9
> >>>>> ubiformat: 2 eraseblocks are supposedly empty
> >>>>> ubiformat: 26 bad eraseblocks found, numbers: 3, 4, 5, 6, 8, 9, 10,
> >>>>> 11, 13, 14, 15, 16, 17, 18, 19, 20, 22, 23, 24, 25, 26, 27, 29, 30,
> >>>>> 31, 32
> >>>>
> >>>> I'm guessing these bad blocks recently added due to the offending patch?
> >>>
> >>> Yes.
> >>>
> >>>>> ubiformat: formatting eras[   33.644323] nand: nand_erase_nand:
> >>>>> attempt to erase a bad block at page 0x00000d40
> >>>>> ubiformat: formatting eraseblock 28[   33.658809] nand:
> >>>>> nand_erase_nand: attempt to erase a bad block at page 0x00000d80
> >>>>> ubiformat: formatting eraseblock 29 --  1 % [   33.674531] nand:
> >>>>> nand_erase_nand: attempt to erase a bad block at page 0x00000dc0
> >>>>> ubiformat: formatting eraseblock 30 --  1 % complete [   33.684508]
> >>>>> nand: nand_erase_nand: attempt to erase a bad block at page 0x00000e00
> >>>>> ubiformat: formatting eraseblock 34 --  1 % complete  libmtd: error!:
> >>>>> MEMERASE64 ioctl failed for eraseblock 34 (mtd5)
> >>>>>         error 5 (Input/output error)
> >>>>>
> >>>>> ubiformat: error!: failed to erase eraseblock 34
> >>>>>            error 5 (Input/output error)
> >>>>> ubiformat: marking block 34 bad
> >>>>> ubiformat: formatting eraseblock 35 --  1 % complete  libmtd: error!:
> >>>>> MEMERASE64 ioctl failed for eraseblock 35 (mtd5)
> >>>>>         error 5 (Input/output error)
> >>>>>
> >>>>> ubiformat: error!: failed to erase eraseblock 35
> >>>>>            error 5 (Input/output error)
> >>>>> ubiformat: marking block 35 bad
> >>>>> ubiformat: formatting eraseblock 36 --  1 % complete  libmtd: error!:
> >>>>> MEMERASE64 ioctl failed for eraseblock 36 (mtd5)
> >>>>>         error 5 (Input/output error)
> >>>>>
> >>>>> ubiformat: error!: failed to erase eraseblock 36
> >>>>>            error 5 (Input/output error)
> >>>>> ubiformat: marking block 36 bad
> >>>>> ubiformat: formatting eraseblock 37 --  1 % complete  libmtd: error!:
> >>>>> MEMERASE64 ioctl failed for eraseblock 37 (mtd5)
> >>>>>         error 5 (Input/output error)
> >>>>>
> >>>>> ubiformat: error!: failed to erase eraseblock 37
> >>>>>            error 5 (Input/output error)
> >>>>> ubiformat: marking block 37 bad
> >>>>>
> >>>>> ubiformat: error!: consecutive bad blocks exceed limit: 4, bad flash?
> >>>>> # [   36.322563] vwl1271: disabling
> >>>>>
> >>>>> git bisect pointed to the following commit:
> >>>>>
> >>>>> a9e849efca4f9c7732ea4a81f13ec96208994b22 is the first bad commit
> >>>>> commit a9e849efca4f9c7732ea4a81f13ec96208994b22
> >>>>> Author: Roger Quadros <rogerq@kernel.org>
> >>>>> Date:   Thu Dec 9 11:04:55 2021 +0200
> >>>>>
> >>>>>     mtd: rawnand: omap2: move to exec_op interface
> >>>>>
> >>>>>     Stop using legacy interface and move to the exec_op interface.
> >>>>>
> >>>>>     Signed-off-by: Roger Quadros <rogerq@kernel.org>
> >>>>>     Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> >>>>>     Link: https://lore.kernel.org/linux-mtd/20211209090458.24830-4-rogerq@kernel.org
> >>>>>
> >>>>> :040000 040000 2341051b8aa8e6b554b8a44d2934f76d1aa460c4
> >>>>> c1727080ff16c403f4ad5ed840acc90127b632f8 M      drivers
> >>>>>
> >>>>> Info to my NAND flash:
> >>>>>
> >>>>> [    5.695760] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xda
> >>>>> [    5.702193] nand: Micron MT29F2G08ABAEAWP
> >>>>> [    5.706356] nand: 256 MiB, SLC, erase size: 128 KiB, page size:
> >>>>> 2048, OOB size: 64
> >>>>> [    5.714204] nand: using OMAP_ECC_BCH8_CODE_HW ECC scheme
> >>>>> [    5.719673] 6 cmdlinepart partitions found on MTD device omap2-nand.0
> >>>>> [    5.726232] Creating 6 MTD partitions on "omap2-nand.0":
> >>>>> [    5.731594] 0x000000000000-0x000000020000 : "SPL"
> >>>>> [    5.737788] mtdblock: MTD device 'SPL' is NAND, please consider
> >>>>> using UBI block devices instead.
> >>>>> [    5.750113] 0x000000020000-0x000000040000 : "SPL.backup1"
> >>>>> [    5.756916] mtdblock: MTD device 'SPL.backup1' is NAND, please
> >>>>> consider using UBI block devices instead.
> >>>>> [    5.769870] 0x000000040000-0x000000060000 : "SPL.backup2"
> >>>>> [    5.776695] mtdblock: MTD device 'SPL.backup2' is NAND, please
> >>>>> consider using UBI block devices instead.
> >>>>> [    5.789559] 0x000000060000-0x000000080000 : "SPL.backup3"
> >>>>> [    5.796423] mtdblock: MTD device 'SPL.backup3' is NAND, please
> >>>>> consider using UBI block devices instead.
> >>>>> [    5.809341] 0x000000080000-0x000000260000 : "u-boot"
> >>>>> [    5.816652] mtdblock: MTD device 'u-boot' is NAND, please consider
> >>>>> using UBI block devices instead.
> >>>>> [    5.829189] 0x000000260000-0x000010000000 : "UBI"
> >>>>> [    5.971508] mtdblock: MTD device 'UBI' is NAND, please consider
> >>>>> using UBI block devices instead.
> >>>>>
> >>>>
> >>>> What platform are you on?
> >>>> I do remember testing this on omap3-beagle but it does not use BCH8 ECC scheme.
> >>>
> >>> I am on am335x [1]
> >>>
> >>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/am335x-baltos-ir5221.dts?h=v5.19-rc4
> >>
> >> NAND node definition [1]:
> >>
> >> &gpmc {
> >> pinctrl-names = "default";
> >> pinctrl-0 = <&nandflash_pins_s0>;
> >> ranges = <0 0 0x08000000 0x10000000>; /* CS0: NAND */
> >> status = "okay";
> >>
> >> nand@0,0 {
> >> compatible = "ti,omap2-nand";
> >> reg = <0 0 4>; /* CS0, offset 0, IO size 4 */
> >> interrupt-parent = <&gpmc>;
> >> interrupts = <0 IRQ_TYPE_NONE>, /* fifoevent */
> >>     <1 IRQ_TYPE_NONE>; /* termcount */
> >> rb-gpios = <&gpmc 0 GPIO_ACTIVE_HIGH>; /* gpmc_wait0 */
> >> nand-bus-width = <8>;
> >> ti,nand-ecc-opt = "bch8";
> >> ti,nand-xfer-type = "polled";
> >
> > Could you please change this to "prefetch-polled" and see if it fixes the issue?
> >
>
> I tried to set ti,nand-xfer-type to "polled" on beagle-c4 board and could not reproduce the issue
> I will need your help please to debug this issue.
>
> Could you please apply the below patch on top of commit a9e849efca4f9c7732ea4a81f13ec96208994b22
> and send me the full kernel log and output of ubiformat command?

I'll post the data later.

The test with the "prefetch-polled" setting looks promising:

1. ubiformat runs without issues
2. I can boot from NAND after "cat MLO > /dev/mtdblock0", etc.
3. the kernel can mount UBIFS as rootfs

The only issue I have for now, is that barebox fails to correctly
mount the first partition (the second with UBIFS rootfs - no problem).
This is how I write to NAND:

ubiformat -y /dev/mtd5
ubiattach -p /dev/mtd5
ubimkvol /dev/ubi0 -N kernel -s 56MiB
mount -t ubifs ubi0:kernel /mnt
cp kernel-fit.itb /mnt
umount /mnt
ubimkvol /dev/ubi0 -N rootfs -s 180MiB
ubiupdatevol /dev/ubi0_1 rootfs.ubifs

barebox log:

Booting from NAND
ubi0: scanning is finished
ubi0: registering /dev/nand0.UBI.ubi
ubi0: registering kernel as /dev/nand0.UBI.ubi.kernel
ubi0: registering rootfs as /dev/nand0.UBI.ubi.rootfs
ubi0: attached mtd0 (name "nand0.UBI", size 253 MiB) to ubi0
ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 129024 bytes
ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 512
ubi0: VID header offset: 512 (aligned 512), data offset: 2048
ubi0: good PEBs: 1999, bad PEBs: 30, corrupted PEBs: 0
ubi0: user volume: 2, internal volumes: 1, max. volumes count: 128
ubi0: max/mean erase counter: 19/13, WL threshold: 65536, image
sequence number: 1371250241
ubi0: available PEBs: 64, total reserved PEBs: 1935, PEBs reserved for
bad PEB handling: 10
UBIFS error (ubi0:0): 8fe548c7: bad superblock, error 13
        magic          0x6101831
        crc            0xfb86a857
        node_type      6 (superblock node)
        group_type     0 (no node group)
        sqnum          2
        len            4096
        key_hash       0 (R5)
        key_fmt        0 (simple)
        flags          0x8
        big_lpt        0
        space_fixup    0
        min_io_size    2048
        leb_size       129024
        leb_cnt        456
        max_leb_cnt    456
        max_bud_bytes  2451456
        log_lebs       3
        lpt_lebs       2
        orph_lebs      2
        jhead_cnt      1
        fanout         8
        lsave_cnt      256
        default_compr  3
        rp_size        2877235
        rp_uid         0
        rp_gid         0
        fmt_version    5
        time_gran      1000000000
        UUID           87fa45e8
ubifs ubifs0: probe failed: Invalid argument
mount: Invalid argument

Yegor

> Thanks!
>
> cheers,
> -roger
>
> From 2775aca0411755c57f90e9c8a0061853275083b4 Mon Sep 17 00:00:00 2001
> From: Roger Quadros <rogerq@kernel.org>
> Date: Wed, 29 Jun 2022 16:40:51 +0300
> Subject: [PATCH] debug: omap-nand: erase operations
>
> add some debug prints in erase operation failure path
>
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
>  drivers/mtd/nand/raw/nand_base.c | 12 ++++++++++++
>  drivers/mtd/nand/raw/omap2.c     |  3 +++
>  2 files changed, 15 insertions(+)
>
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 113a2e9f43b1..3b1a599bcec5 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -1848,24 +1848,36 @@ int nand_erase_op(struct nand_chip *chip, unsigned int eraseblock)
>
>                 ret = nand_exec_op(chip, &op);
>                 if (ret)
> +               {
> +                       pr_err("%s: exec_op failed %d\n", __func__, ret);
>                         return ret;
> +               }
>
>                 ret = nand_status_op(chip, &status);
>                 if (ret)
> +               {
> +                       pr_err("%s: status_op failed %d\n", __func__, ret);
>                         return ret;
> +               }
>         } else {
>                 chip->legacy.cmdfunc(chip, NAND_CMD_ERASE1, -1, page);
>                 chip->legacy.cmdfunc(chip, NAND_CMD_ERASE2, -1, -1);
>
>                 ret = chip->legacy.waitfunc(chip);
>                 if (ret < 0)
> +               {
> +                       pr_err("%s: legacy wait failed %d\n", __func__, ret);
>                         return ret;
> +               }
>
>                 status = ret;
>         }
>
>         if (status & NAND_STATUS_FAIL)
> +       {
> +               pr_err("%s: NAND_STATUS fail\n", __func__);
>                 return -EIO;
> +       }
>
>         return 0;
>  }
> diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
> index 224c91282c87..5b1297333bed 100644
> --- a/drivers/mtd/nand/raw/omap2.c
> +++ b/drivers/mtd/nand/raw/omap2.c
> @@ -2130,7 +2130,10 @@ static int omap_nand_exec_instr(struct nand_chip *chip,
>                         nand_gpio_waitrdy(chip, info->ready_gpiod, instr->ctx.waitrdy.timeout_ms) :
>                         nand_soft_waitrdy(chip, instr->ctx.waitrdy.timeout_ms);
>                 if (ret)
> +               {
> +                       dev_info(&info->pdev->dev, "%s: wait timeout %d, %px\n", __func__, ret, info->ready_gpiod);
>                         return ret;
> +               }
>                 break;
>         }
>
> --
> 2.17.1
>
>
