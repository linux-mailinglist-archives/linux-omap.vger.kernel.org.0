Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4BE612F5B0
	for <lists+linux-omap@lfdr.de>; Fri,  3 Jan 2020 09:47:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbgACIrN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 3 Jan 2020 03:47:13 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.21]:21596 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbgACIrM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 3 Jan 2020 03:47:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1578041227;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=wKdBgQpAaiqvssRP9nw70UdnpbTeHX3ycIW/36/WGMs=;
        b=mkvfSnsgD3CVXYXaKSA4fC82Vsz5eEBj0Y4ipvbdesXQcjlda/6nnE3RLkpebYCM/d
        Km2kvLNDZTZeK3Axif0oZIwHqpkxycLfGt1Y1BRow6PGxuOaalRvH1yWQ743vJPJ9CDm
        KehHJOkdyvakR3Kn+J+/qqjX/82I/IyCByuH0RVKYChPRaf+aniXDYOQN7BuIh3psCM6
        p8wdSB51zNKF1R0FdD8LWhoT2hbDYRFxLmMr4uGp6HB2iZAVFkF7BJrzK64T8jt5TkvZ
        QE57XE0MHH4vLeCrdDYdbgRzPK3c/ZZPdk1AvkJySucH8eMRg6dzXvUmpN21pNJcalgq
        j18A==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmMkw43qEhA="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.1.3 DYNA|AUTH)
        with ESMTPSA id a09dafw038kxMP7
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Fri, 3 Jan 2020 09:46:59 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [BISECTED, REGRESSION] OMAP3 onenand/DMA broken
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200103081726.GD15023@darkstar.musicnaut.iki.fi>
Date:   Fri, 3 Jan 2020 09:46:58 +0100
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: 7bit
Message-Id: <6D46CA13-2E50-4144-86F1-CE4988BD654D@goldelico.com>
References: <20200103081726.GD15023@darkstar.musicnaut.iki.fi>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

> Am 03.01.2020 um 09:17 schrieb Aaro Koskinen <aaro.koskinen@iki.fi>:
> 
> Hi,
> 
> When booting v5.4 (or v5.5-rc4) on N900, the console gets flooded with:
> 
> [    8.335754] omap2-onenand 1000000.onenand: timeout waiting for DMA
> [    8.365753] omap2-onenand 1000000.onenand: timeout waiting for DMA
> [    8.395751] omap2-onenand 1000000.onenand: timeout waiting for DMA
> [    8.425750] omap2-onenand 1000000.onenand: timeout waiting for DMA
> [    8.455749] omap2-onenand 1000000.onenand: timeout waiting for DMA
> [    8.485748] omap2-onenand 1000000.onenand: timeout waiting for DMA
> [    8.515777] omap2-onenand 1000000.onenand: timeout waiting for DMA
> [    8.545776] omap2-onenand 1000000.onenand: timeout waiting for DMA
> [    8.575775] omap2-onenand 1000000.onenand: timeout waiting for DMA
> 
> making the system unusable.

I can confirm that this issue exists but so far we failed to bisect
and make a proper report.

Sometimes the system boots fine and sometimes it fails.

It happens on omap3-gta04a5one.dts only, but not with omap3-gta04a4.dts
(both dm3730 but different NAND).

> 
> Bisected to:
> 
> 4689d35c765c696bdf0535486a990038b242a26b is the first bad commit
> commit 4689d35c765c696bdf0535486a990038b242a26b
> Author: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Date:   Tue Jul 16 11:24:59 2019 +0300
> 
>    dmaengine: ti: omap-dma: Improved memcpy polling support
> 
> The commit does not revert cleanly anymore. Any ideas how to fix this?
> 
> A.

BR, Nikolaus
