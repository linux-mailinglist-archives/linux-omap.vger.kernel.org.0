Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5492B55E145
	for <lists+linux-omap@lfdr.de>; Tue, 28 Jun 2022 15:33:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239920AbiF1Ksh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 Jun 2022 06:48:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242743AbiF1Ksg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 Jun 2022 06:48:36 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DCC1114F
        for <linux-omap@vger.kernel.org>; Tue, 28 Jun 2022 03:48:30 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-3178acf2a92so112487127b3.6
        for <linux-omap@vger.kernel.org>; Tue, 28 Jun 2022 03:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=TvBS1CPFquLgQjmgRqByyxoMhBcAVYRHfsLh3BdY+Qc=;
        b=Usi9eQgoxV7bgqYNBQghlN4B0qR2V5V6rfjC3rcXPHyRJY455nOK4mgUlYshwVDkQN
         EG3uH3o9eVxTXkOtSt0y27JvcJUQMpMwiC4WkSab7BKyEwO97j0QXk79yFtdMXKbyoZK
         Q+eVjFMtJpS/fppaCQyOeRfYI4f0oQn9Lgwb28bltlR580sV4dNmYHXoshSw0yYGEIC/
         4sBI5vKdlrVswrAOY/D73Vse9YcpvIcJhZjX27L9MNvf5Bu0oRjrtSbxODEx12V7+avB
         NVp88Xm6kHcPhmvlHIRnmdMR5kNV8SXbHaVO1OTghnduETMbaAprYyzk8BfzdLePYYfF
         +ukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=TvBS1CPFquLgQjmgRqByyxoMhBcAVYRHfsLh3BdY+Qc=;
        b=3D6n14yW0qRkFCUAvVrSb4Irv2qjFDt3dqKeilUbKDYo+uIqs4kAEKk6ohjgss0UJS
         tcp5llfL/697l4SykaxE9Vnb83tVYtOF8+eJ9R7DOqtuZo51WGgRVEOWJ4VRhwsZxlt0
         YEcX6RoiZhMlm+nxZh0uNK36p+8aGJBTMK1cUUWMfXZi1fqvh7pfr+cqD6AenUYtqggy
         U6hky/djk+HMrHf4QV+PD+puFeR3P01ZXWA8adHFQW0OykRdHKZgO4Oyv5EDW8MoN5ls
         u5XUn7f0kJf+hGbGEwWKVVeaQMrJJzQZJjyR3msiWRYTI5yoTmBxkNbzufh0cvtLEoCs
         W5Vg==
X-Gm-Message-State: AJIora8mzNT8fCd/FBplsbEr+jgfr7nLARFInzEKQqSQXuQ6if4Wj7jA
        HJgghe7VFHavgKFSyv4DgEgL/R14bloX+nx4aW1VJmY5wu20xQ==
X-Google-Smtp-Source: AGRyM1veEJ+dHNxzAaiO9kYPPy/eRNb0nxNDX23qqgEyPM648hNmewsEY0QJNth2cRVFOgXERKFTcmvAQ2D2MRsSc7s=
X-Received: by 2002:a05:690c:102:b0:2ef:48d8:24c3 with SMTP id
 bd2-20020a05690c010200b002ef48d824c3mr20507253ywb.153.1656413309834; Tue, 28
 Jun 2022 03:48:29 -0700 (PDT)
MIME-Version: 1.0
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Tue, 28 Jun 2022 12:48:18 +0200
Message-ID: <CAGm1_ktXBp-sz3Dud_G0iqOG=vA=Xp-bj-icwNLVgq-AMqKO7A@mail.gmail.com>
Subject: raw/omap2: erasing issue
To:     linux-mtd@lists.infradead.org
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>, rogerq@kernel.org,
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

Since linux 5.17 I get the following issue when doing ubiformat:

# ubiformat -y /dev/mtd5
ubiformat: mtd5 (nand), size 265945088 bytes (253.6 MiB), 2029
eraseblocks of 131072 bytes (128.0 KiB), min. I/O size 2048 bytes
libscan: scanning eraseblock 1097 -- 54 % complete  eth1 timed out to bring up
libscan: scanning eraseblock 2028 -- 100 % complete
ubiformat: 2001 eraseblocks have valid erase counter, mean value is 9
ubiformat: 2 eraseblocks are supposedly empty
ubiformat: 26 bad eraseblocks found, numbers: 3, 4, 5, 6, 8, 9, 10,
11, 13, 14, 15, 16, 17, 18, 19, 20, 22, 23, 24, 25, 26, 27, 29, 30,
31, 32
ubiformat: formatting eras[   33.644323] nand: nand_erase_nand:
attempt to erase a bad block at page 0x00000d40
ubiformat: formatting eraseblock 28[   33.658809] nand:
nand_erase_nand: attempt to erase a bad block at page 0x00000d80
ubiformat: formatting eraseblock 29 --  1 % [   33.674531] nand:
nand_erase_nand: attempt to erase a bad block at page 0x00000dc0
ubiformat: formatting eraseblock 30 --  1 % complete [   33.684508]
nand: nand_erase_nand: attempt to erase a bad block at page 0x00000e00
ubiformat: formatting eraseblock 34 --  1 % complete  libmtd: error!:
MEMERASE64 ioctl failed for eraseblock 34 (mtd5)
        error 5 (Input/output error)

ubiformat: error!: failed to erase eraseblock 34
           error 5 (Input/output error)
ubiformat: marking block 34 bad
ubiformat: formatting eraseblock 35 --  1 % complete  libmtd: error!:
MEMERASE64 ioctl failed for eraseblock 35 (mtd5)
        error 5 (Input/output error)

ubiformat: error!: failed to erase eraseblock 35
           error 5 (Input/output error)
ubiformat: marking block 35 bad
ubiformat: formatting eraseblock 36 --  1 % complete  libmtd: error!:
MEMERASE64 ioctl failed for eraseblock 36 (mtd5)
        error 5 (Input/output error)

ubiformat: error!: failed to erase eraseblock 36
           error 5 (Input/output error)
ubiformat: marking block 36 bad
ubiformat: formatting eraseblock 37 --  1 % complete  libmtd: error!:
MEMERASE64 ioctl failed for eraseblock 37 (mtd5)
        error 5 (Input/output error)

ubiformat: error!: failed to erase eraseblock 37
           error 5 (Input/output error)
ubiformat: marking block 37 bad

ubiformat: error!: consecutive bad blocks exceed limit: 4, bad flash?
# [   36.322563] vwl1271: disabling

git bisect pointed to the following commit:

a9e849efca4f9c7732ea4a81f13ec96208994b22 is the first bad commit
commit a9e849efca4f9c7732ea4a81f13ec96208994b22
Author: Roger Quadros <rogerq@kernel.org>
Date:   Thu Dec 9 11:04:55 2021 +0200

    mtd: rawnand: omap2: move to exec_op interface

    Stop using legacy interface and move to the exec_op interface.

    Signed-off-by: Roger Quadros <rogerq@kernel.org>
    Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
    Link: https://lore.kernel.org/linux-mtd/20211209090458.24830-4-rogerq@kernel.org

:040000 040000 2341051b8aa8e6b554b8a44d2934f76d1aa460c4
c1727080ff16c403f4ad5ed840acc90127b632f8 M      drivers

Info to my NAND flash:

[    5.695760] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xda
[    5.702193] nand: Micron MT29F2G08ABAEAWP
[    5.706356] nand: 256 MiB, SLC, erase size: 128 KiB, page size:
2048, OOB size: 64
[    5.714204] nand: using OMAP_ECC_BCH8_CODE_HW ECC scheme
[    5.719673] 6 cmdlinepart partitions found on MTD device omap2-nand.0
[    5.726232] Creating 6 MTD partitions on "omap2-nand.0":
[    5.731594] 0x000000000000-0x000000020000 : "SPL"
[    5.737788] mtdblock: MTD device 'SPL' is NAND, please consider
using UBI block devices instead.
[    5.750113] 0x000000020000-0x000000040000 : "SPL.backup1"
[    5.756916] mtdblock: MTD device 'SPL.backup1' is NAND, please
consider using UBI block devices instead.
[    5.769870] 0x000000040000-0x000000060000 : "SPL.backup2"
[    5.776695] mtdblock: MTD device 'SPL.backup2' is NAND, please
consider using UBI block devices instead.
[    5.789559] 0x000000060000-0x000000080000 : "SPL.backup3"
[    5.796423] mtdblock: MTD device 'SPL.backup3' is NAND, please
consider using UBI block devices instead.
[    5.809341] 0x000000080000-0x000000260000 : "u-boot"
[    5.816652] mtdblock: MTD device 'u-boot' is NAND, please consider
using UBI block devices instead.
[    5.829189] 0x000000260000-0x000010000000 : "UBI"
[    5.971508] mtdblock: MTD device 'UBI' is NAND, please consider
using UBI block devices instead.


Regards,
Yegor
