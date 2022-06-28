Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7649955DDD9
	for <lists+linux-omap@lfdr.de>; Tue, 28 Jun 2022 15:28:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344572AbiF1L7R (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 Jun 2022 07:59:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345051AbiF1L7Q (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 Jun 2022 07:59:16 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28E8A12D00
        for <linux-omap@vger.kernel.org>; Tue, 28 Jun 2022 04:59:15 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-31bf3656517so23550607b3.12
        for <linux-omap@vger.kernel.org>; Tue, 28 Jun 2022 04:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=urktvsoNnEVnDx7xaP6tHk1gInrIpPly61GP22mC1qg=;
        b=fRY95PmmWe7MIwiUdIdYi3Lw9szOK9Gbq1UJa0nv783imFShh2Vs5h500gj3IVwSsX
         lsZuZ6hzGhJuYxzI7Kb9xXbvOHC2F0cdGf8bL3/PCoOv0Xab/cZnBKrW6vCqudrj5VBB
         VR+YlnZ4wZSv5pUEcHUSTJGIZvuiO+1CSRfWOwG2AuDvOKhXv61cKk/nVHaek5CTJtTR
         LGfAkqIw2npVapsjfB54T0oRBnOGjaKdSHtvxdd2CkA8Urlp4q+HdMwEKHQLoccTYXE4
         C5aUlFkUSsPxzviQcbKH6l081+PWT36CPBa6pVbB5/niieCvohkanTH5DgzK/pdBAKvn
         zkRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=urktvsoNnEVnDx7xaP6tHk1gInrIpPly61GP22mC1qg=;
        b=jMKp1Kjao6TQdNGZOD6Sk66B6w8qtMIk7+wjzj9S91JzR6WtcgWZKWivupKUWWigSJ
         VBLZSweYiwVdqfk98tuKeBgNuskzwzjogM0/utiCeHh419R82KAVwZ3n45P9OGTnTkzL
         hRyZicG4wjij4VBDa1E/Gi01FPFz+cwwkRkBJIH4vfNgciLKGXSXSa/7SZWC9ZTc/arK
         I1g7ZFoaVaB8OatF40Z2IjVnYaWGEX4fLP7EFThep/2PItPOuTPknAAIhBbU+Ozl+k0H
         tuST3vpgd6xL0li4NCJHAMkLfnqPaQovGg4Q8VjZdEfnXo8yqGE2gfNFH67Cy1m/8ob6
         URSQ==
X-Gm-Message-State: AJIora9FPjSeW/jjqZ8fCZ4aCyHg6aR/lIgdyswAmwlHuKyV5jXv9+Dg
        +D9iZvnzQvx6FuYA67uGy8qSojp75b3zVS8YjBo=
X-Google-Smtp-Source: AGRyM1uUM8XiXqp0nPoKN6eYyG6dEL16I70UKKw3R0wyE+J78ZDNrmS2GK27qNBSxrCS/87shzyPvDxsDJlUC4vzguU=
X-Received: by 2002:a81:a212:0:b0:317:7a55:c7cb with SMTP id
 w18-20020a81a212000000b003177a55c7cbmr21066715ywg.13.1656417554364; Tue, 28
 Jun 2022 04:59:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm1_ktXBp-sz3Dud_G0iqOG=vA=Xp-bj-icwNLVgq-AMqKO7A@mail.gmail.com>
 <72686231-c372-a4fe-347e-39470790fa65@kernel.org> <CAGm1_kvRuWY7t2d_BtuSLGEL1u4njRqha=D0f7eN9F5XG8GrLQ@mail.gmail.com>
In-Reply-To: <CAGm1_kvRuWY7t2d_BtuSLGEL1u4njRqha=D0f7eN9F5XG8GrLQ@mail.gmail.com>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Tue, 28 Jun 2022 13:59:03 +0200
Message-ID: <CAGm1_kuucv71AdPkSW8Eog2T9rZRA3uiL4+ok-aWCVsj-z2eew@mail.gmail.com>
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

On Tue, Jun 28, 2022 at 1:57 PM Yegor Yefremov
<yegorslists@googlemail.com> wrote:
>
> Hi Roger,
>
> On Tue, Jun 28, 2022 at 1:44 PM Roger Quadros <rogerq@kernel.org> wrote:
> >
> > Hi Yegor,
> >
> > On 28/06/2022 13:48, Yegor Yefremov wrote:
> > > Since linux 5.17 I get the following issue when doing ubiformat:
> > >
> > > # ubiformat -y /dev/mtd5
> > > ubiformat: mtd5 (nand), size 265945088 bytes (253.6 MiB), 2029
> > > eraseblocks of 131072 bytes (128.0 KiB), min. I/O size 2048 bytes
> > > libscan: scanning eraseblock 1097 -- 54 % complete  eth1 timed out to bring up
> > > libscan: scanning eraseblock 2028 -- 100 % complete
> > > ubiformat: 2001 eraseblocks have valid erase counter, mean value is 9
> > > ubiformat: 2 eraseblocks are supposedly empty
> > > ubiformat: 26 bad eraseblocks found, numbers: 3, 4, 5, 6, 8, 9, 10,
> > > 11, 13, 14, 15, 16, 17, 18, 19, 20, 22, 23, 24, 25, 26, 27, 29, 30,
> > > 31, 32
> >
> > I'm guessing these bad blocks recently added due to the offending patch?
>
> Yes.
>
> > > ubiformat: formatting eras[   33.644323] nand: nand_erase_nand:
> > > attempt to erase a bad block at page 0x00000d40
> > > ubiformat: formatting eraseblock 28[   33.658809] nand:
> > > nand_erase_nand: attempt to erase a bad block at page 0x00000d80
> > > ubiformat: formatting eraseblock 29 --  1 % [   33.674531] nand:
> > > nand_erase_nand: attempt to erase a bad block at page 0x00000dc0
> > > ubiformat: formatting eraseblock 30 --  1 % complete [   33.684508]
> > > nand: nand_erase_nand: attempt to erase a bad block at page 0x00000e00
> > > ubiformat: formatting eraseblock 34 --  1 % complete  libmtd: error!:
> > > MEMERASE64 ioctl failed for eraseblock 34 (mtd5)
> > >         error 5 (Input/output error)
> > >
> > > ubiformat: error!: failed to erase eraseblock 34
> > >            error 5 (Input/output error)
> > > ubiformat: marking block 34 bad
> > > ubiformat: formatting eraseblock 35 --  1 % complete  libmtd: error!:
> > > MEMERASE64 ioctl failed for eraseblock 35 (mtd5)
> > >         error 5 (Input/output error)
> > >
> > > ubiformat: error!: failed to erase eraseblock 35
> > >            error 5 (Input/output error)
> > > ubiformat: marking block 35 bad
> > > ubiformat: formatting eraseblock 36 --  1 % complete  libmtd: error!:
> > > MEMERASE64 ioctl failed for eraseblock 36 (mtd5)
> > >         error 5 (Input/output error)
> > >
> > > ubiformat: error!: failed to erase eraseblock 36
> > >            error 5 (Input/output error)
> > > ubiformat: marking block 36 bad
> > > ubiformat: formatting eraseblock 37 --  1 % complete  libmtd: error!:
> > > MEMERASE64 ioctl failed for eraseblock 37 (mtd5)
> > >         error 5 (Input/output error)
> > >
> > > ubiformat: error!: failed to erase eraseblock 37
> > >            error 5 (Input/output error)
> > > ubiformat: marking block 37 bad
> > >
> > > ubiformat: error!: consecutive bad blocks exceed limit: 4, bad flash?
> > > # [   36.322563] vwl1271: disabling
> > >
> > > git bisect pointed to the following commit:
> > >
> > > a9e849efca4f9c7732ea4a81f13ec96208994b22 is the first bad commit
> > > commit a9e849efca4f9c7732ea4a81f13ec96208994b22
> > > Author: Roger Quadros <rogerq@kernel.org>
> > > Date:   Thu Dec 9 11:04:55 2021 +0200
> > >
> > >     mtd: rawnand: omap2: move to exec_op interface
> > >
> > >     Stop using legacy interface and move to the exec_op interface.
> > >
> > >     Signed-off-by: Roger Quadros <rogerq@kernel.org>
> > >     Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > >     Link: https://lore.kernel.org/linux-mtd/20211209090458.24830-4-rogerq@kernel.org
> > >
> > > :040000 040000 2341051b8aa8e6b554b8a44d2934f76d1aa460c4
> > > c1727080ff16c403f4ad5ed840acc90127b632f8 M      drivers
> > >
> > > Info to my NAND flash:
> > >
> > > [    5.695760] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xda
> > > [    5.702193] nand: Micron MT29F2G08ABAEAWP
> > > [    5.706356] nand: 256 MiB, SLC, erase size: 128 KiB, page size:
> > > 2048, OOB size: 64
> > > [    5.714204] nand: using OMAP_ECC_BCH8_CODE_HW ECC scheme
> > > [    5.719673] 6 cmdlinepart partitions found on MTD device omap2-nand.0
> > > [    5.726232] Creating 6 MTD partitions on "omap2-nand.0":
> > > [    5.731594] 0x000000000000-0x000000020000 : "SPL"
> > > [    5.737788] mtdblock: MTD device 'SPL' is NAND, please consider
> > > using UBI block devices instead.
> > > [    5.750113] 0x000000020000-0x000000040000 : "SPL.backup1"
> > > [    5.756916] mtdblock: MTD device 'SPL.backup1' is NAND, please
> > > consider using UBI block devices instead.
> > > [    5.769870] 0x000000040000-0x000000060000 : "SPL.backup2"
> > > [    5.776695] mtdblock: MTD device 'SPL.backup2' is NAND, please
> > > consider using UBI block devices instead.
> > > [    5.789559] 0x000000060000-0x000000080000 : "SPL.backup3"
> > > [    5.796423] mtdblock: MTD device 'SPL.backup3' is NAND, please
> > > consider using UBI block devices instead.
> > > [    5.809341] 0x000000080000-0x000000260000 : "u-boot"
> > > [    5.816652] mtdblock: MTD device 'u-boot' is NAND, please consider
> > > using UBI block devices instead.
> > > [    5.829189] 0x000000260000-0x000010000000 : "UBI"
> > > [    5.971508] mtdblock: MTD device 'UBI' is NAND, please consider
> > > using UBI block devices instead.
> > >
> >
> > What platform are you on?
> > I do remember testing this on omap3-beagle but it does not use BCH8 ECC scheme.
>
> I am on am335x [1]
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/am335x-baltos-ir5221.dts?h=v5.19-rc4

NAND node definition [1]:

&gpmc {
pinctrl-names = "default";
pinctrl-0 = <&nandflash_pins_s0>;
ranges = <0 0 0x08000000 0x10000000>; /* CS0: NAND */
status = "okay";

nand@0,0 {
compatible = "ti,omap2-nand";
reg = <0 0 4>; /* CS0, offset 0, IO size 4 */
interrupt-parent = <&gpmc>;
interrupts = <0 IRQ_TYPE_NONE>, /* fifoevent */
    <1 IRQ_TYPE_NONE>; /* termcount */
rb-gpios = <&gpmc 0 GPIO_ACTIVE_HIGH>; /* gpmc_wait0 */
nand-bus-width = <8>;
ti,nand-ecc-opt = "bch8";
ti,nand-xfer-type = "polled";

gpmc,device-nand = "true";
gpmc,device-width = <1>;
gpmc,sync-clk-ps = <0>;
gpmc,cs-on-ns = <0>;
gpmc,cs-rd-off-ns = <44>;
gpmc,cs-wr-off-ns = <44>;
gpmc,adv-on-ns = <6>;
gpmc,adv-rd-off-ns = <34>;
gpmc,adv-wr-off-ns = <44>;
gpmc,we-on-ns = <0>;
gpmc,we-off-ns = <40>;
gpmc,oe-on-ns = <0>;
gpmc,oe-off-ns = <54>;
gpmc,access-ns = <64>;
gpmc,rd-cycle-ns = <82>;
gpmc,wr-cycle-ns = <82>;
gpmc,bus-turnaround-ns = <0>;
gpmc,cycle2cycle-delay-ns = <0>;
gpmc,clk-activation-ns = <0>;
gpmc,wr-access-ns = <40>;
gpmc,wr-data-mux-bus-ns = <0>;

#address-cells = <1>;
#size-cells = <1>;
ti,elm-id = <&elm>;
};
};

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/am335x-baltos.dtsi?h=v5.19-rc4#n185
