Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C1A8560B36
	for <lists+linux-omap@lfdr.de>; Wed, 29 Jun 2022 22:43:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbiF2UnT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 29 Jun 2022 16:43:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229745AbiF2UnS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 29 Jun 2022 16:43:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6391821241
        for <linux-omap@vger.kernel.org>; Wed, 29 Jun 2022 13:43:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F1B1C60A1E
        for <linux-omap@vger.kernel.org>; Wed, 29 Jun 2022 20:43:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54B16C341CC
        for <linux-omap@vger.kernel.org>; Wed, 29 Jun 2022 20:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656535396;
        bh=ds5+xsPIagNwPl3Z4A5TavHTNPqV/6jafhXXZEluXek=;
        h=From:Date:Subject:To:Cc:From;
        b=d+fmV9Ev98gKGm/ASCGyU7H3DQPJiptxyFq/utE1khFtnh1UA0qbliC/sUI6HYAXi
         /ZBstrBS1F5qp8Nu5kNwzPpRB4TusBxYJHkMySbFg6Cl5rBstMX8LomOdBeC3L/MV+
         VeHUxIcLuDd2JFI5vMXa5AXOhJt1Vz2PVmnYaO6/awnCvabGWQfMZ2Pgs1Q057tXiB
         PVbA01euE2tw0yeWnvDiDKXtNWyp56pQygL0IFr4A8bW5na25iTx1jqKcJaElbff3d
         7l+dUv4zqH84u6WZ6nlOKdPtg4EcnPfmAP+7zDKHo1TPwd9n8r3YfMJ9c+d51FW/aA
         7k3WFZxAaLTFA==
Received: by mail-yb1-f177.google.com with SMTP id l11so30047708ybu.13
        for <linux-omap@vger.kernel.org>; Wed, 29 Jun 2022 13:43:16 -0700 (PDT)
X-Gm-Message-State: AJIora+h9POBXY6lpFZcULOhzem8bb98ghV/IoA4NPBxR+pjbXY6e/aP
        aMf/aQTd07fuYVRxSKtCkBXNrpC+yiuaB87/IFA=
X-Google-Smtp-Source: AGRyM1s0u+VXnAyJrYbHo+9/7dGEySBa5UU3o37SweEJABhpN1WmxepLhwqoZpp2BYg9EL3tX0PbrooNI4CikirU/pM=
X-Received: by 2002:a25:760e:0:b0:66c:95eb:6c69 with SMTP id
 r14-20020a25760e000000b0066c95eb6c69mr5667796ybc.106.1656535395240; Wed, 29
 Jun 2022 13:43:15 -0700 (PDT)
MIME-Version: 1.0
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Wed, 29 Jun 2022 22:42:58 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0Z9vGEQbVRBo84bSyPFM-LF+hs5w8ZA51g2Z+NsdtDQA@mail.gmail.com>
Message-ID: <CAK8P3a0Z9vGEQbVRBo84bSyPFM-LF+hs5w8ZA51g2Z+NsdtDQA@mail.gmail.com>
Subject: Scheduling (unused) board file removal for linux-6.x
To:     Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Russell King <rmk+kernel@armlinux.org.uk>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Halasa <khalasa@piap.pl>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Marek Vasut <marek.vasut@gmail.com>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Hartley Sweeten <hsweeten@visionengravers.com>,
        linux-omap <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Lennert Buytenhek <kernel@wantstofly.org>,
        Marc Zyngier <maz@kernel.org>,
        Mauri Sandberg <maukka@ext.kapsi.fi>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

With the multiplatform work completed in the past merge window, and the
scheduled deprecation of the Samsung s3c platforms, I decided to have a
look at the remaining board files. There are 196 remaining boards, down
from 489 boards ten years ago, but my estimate is that only few of those
ever booted a linux-5.x kernel, and even less for future kernels. The
question is how to find out which ones are still used, and which ones
can go.

I would propose that we start by changing the assumption that all boards
might be used, instead assuming that they are all outdated unless someone
says that they actually prefer to keep it in the kernel.  I have started
a list of all 196 boards and annotated the ones that look like candidates
for removal [1]. If a board you use is on that list, please either reply
here or add a comment in the document.

Unless someone has a better idea for how to proceed, I would allow
six months for users to speak up and then remove the orphaned board
files for the release following the LTS kernel. I can't list all boards
individually, so here is a breakdown by platform:

s3c24xx

These are all scheduled for removal in early 2023 already, once the next
longterm stable kernel is out. No changes here, but it seems useful
to use the same timeline for removing unused board files of the other
platforms together.

s3c64xx

There are ten board files, which are currently scheduled for removal in
2024, along with the DT based boards for this SoC. We can still decide
to throw out some of the board files earlier though, while keeping the
platform around.

cns3xxx

There is only one reference board here, the actual products that were
previously supported, none of the board files from openwrt (now gone) made
it in, and the DT support was never completed, so the entire platform can
go away. We could also consider dropping the other arm11mpcore platforms
(oxnas and the mpcore variants of realview/integrator) at the same time,
since there are known issues with the CPU core.

iop32x

Some of the NAS devices were still in use two years ago as they have
a lot of RAM for an ARMv5 based machine, not sure if they still are
used. If they are, a DT conversion similar to what we did for ixp4xx
should be possible.

pxa

There are a ton of boards on this one, including seven with qemu support,
but based on IRC discussions, my feeling is that everyone who worked on
this has already lost interest a few years ago. There is rudimentary DT
support, so it may be helpful to pick one or two boards (gumstix?) with
good qemu support and keep them around for conversion to DT, while
removing all other boards.

mmp

This already has better DT support than pxa, at least for the ARMv7
based SoCs. The remaining nine board files are all candidates for removal.

sa1100

Similar to PXA, work on this appears to have stopped. Russell probably
still has an Assabet or some other machine, but I don't know if he
still plans to keep using new kernels on those. The only machine with
qemu support is Collie (Sharp SL-5500), so if we keep any boards at all,
then this should be kept as well. Probably no point doing a DT conversion
here though.

rpc

Russell is the only known user, and is likely to keep this one around
for as long as gcc can still build kernels (it needs gcc-8 or older).

footbridge

Three machines, most notably the NetWinder that a few people still have.
I assume Russell wants to keep the machines working that he still has.
ep93xx

These are still used, and the platform includes the only remaining two
board files that were added after linux-3.0. DT support is probably
doable now that common-clk works. Need information about which boards
are important.

omap1

common-clk and multiplatform support just landed. There are three boards
that are likely to be in use (ams-delta, osk and nokia770) and two boards
supported by qemu (sx1 and palmte), so we may want to keep those and
try to eventually convert them to DT. The rest can probably get retired.

davinci

DT conversion has stalled, and there are 12 remaining board files,
mostly for evaluation machines. No idea if any are still in use.

orion5x

DT conversion depends on stalled work for PCI. 16 boards never got
converted because of this, still enabled in Debian.  Can probably drop the
reference boards and the machines with less than 64MB. Debian_on_Buffalo
project apparently tries to keep these working, but there is also some
new interest in finishing DT conversion.

mv78xx0

Similar to orion5x, but lacking DT support completely. Only three
machines: one NAS and two reference design.

dove

Two board files, both of which have (incomplete) DT support as well.
Russell previously wanted to keep these around, not sure if he still
cares.

         Arnd

[1] https://docs.google.com/spreadsheets/d/1PL4dUUSieeXHzZhAn_Rnix32OTiCfN33sCQejpvI6ng/edit#gid=0
