Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0B535EBFC7
	for <lists+linux-omap@lfdr.de>; Tue, 27 Sep 2022 12:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230206AbiI0Kar (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Sep 2022 06:30:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231748AbiI0Kan (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 27 Sep 2022 06:30:43 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1CB17D4AAC
        for <linux-omap@vger.kernel.org>; Tue, 27 Sep 2022 03:30:40 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id E293D80A6;
        Tue, 27 Sep 2022 10:22:20 +0000 (UTC)
Date:   Tue, 27 Sep 2022 13:30:38 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Romain Naour <romain.naour@smile.fr>
Cc:     Vignesh Raghavendra <vigneshr@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "rogerq@kernel.org >> Roger Quadros" <rogerq@kernel.org>,
        Md Danish Anwar <danishanwar@ti.com>
Subject: Re: prueth: IEP driver doesn't probe anymore
Message-ID: <YzLQzok4Wo9hHBop@atomide.com>
References: <9aced000-5e66-50b9-1e1b-28ff96871d42@smile.fr>
 <28dc112e-94ce-ca21-2e35-97074f251b97@smile.fr>
 <edf56bca-3f90-5cac-7c21-085f4a563dac@smile.fr>
 <YzKa8csiFaJik79O@atomide.com>
 <714a68ee-a211-ea63-1da7-5962dbad9f39@ti.com>
 <276295a7-c6e0-5200-f6da-9c7298c914be@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <276295a7-c6e0-5200-f6da-9c7298c914be@smile.fr>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,URI_HEX autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Romain Naour <romain.naour@smile.fr> [220927 10:03]:
> I rebased the prueth + IEP series on v6.0-rc7 and indeed the driver probe
> correctly but with some delay due deferred probe.

OK great. FYI, see commit 0b3acd1cc022 ("Merge tag 'driver-core-6.0-rc4' of
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core") for details
on what got merged.

> [    9.568817] remoteproc remoteproc0: 4b234000.pru is available
> [    9.580505] remoteproc remoteproc1: 4b238000.pru is available
> [    9.625701] remoteproc remoteproc2: 4b2b4000.pru is available
> [    9.632110] remoteproc remoteproc3: 4b2b8000.pru is available
> [    9.932952] prueth pruss1_eth: unable to get IEP
> [   10.238098] prueth pruss1_eth: unable to get IEP
> [   10.469421] prueth pruss1_eth: unable to get IEP
> [   10.675445] prueth pruss1_eth: unable to get IEP
> [   10.885589] prueth pruss1_eth: unable to get IEP
> [   11.117126] prueth pruss1_eth: unable to get IEP
> [   11.755462] prueth pruss1_eth: unable to get IEP
> [   12.316192] prueth pruss1_eth: unable to get IEP
> [   13.387969] prueth pruss1_eth: unable to get IEP
> [   14.175750] prueth pruss1_eth: unable to get IEP
> [   14.388671] prueth pruss1_eth: unable to get IEP
> [   14.648406] prueth pruss1_eth: unable to get IEP
> [   16.946716] prueth pruss1_eth: unable to get IEP
> [   25.037414] remoteproc remoteproc1: powering up 4b238000.pru
> [   25.056793] remoteproc remoteproc1: Booting fw image
> ti-pruss/am57xx-pru1-prueth-fw.elf, size 6952
> [   25.065856] remoteproc remoteproc1: unsupported resource 5
> [   25.071472] remoteproc remoteproc1: remote processor 4b238000.pru is now up
> [   25.157104] remoteproc remoteproc0: powering up 4b234000.pru
> [   25.165527] remoteproc remoteproc0: Booting fw image
> ti-pruss/am57xx-pru0-prueth-fw.elf, size 6920
> [   25.174713] remoteproc remoteproc0: unsupported resource 5
> [   25.180328] remoteproc remoteproc0: remote processor 4b234000.pru is now up
> [   27.047607] prueth pruss1_eth eth4: Link is Up - 100Mbps/Full - flow control off

Seem like this is still not ideal with delayed and noisy deferred probe :(

Regards,

Tony
