Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A51244C5E8
	for <lists+linux-omap@lfdr.de>; Wed, 10 Nov 2021 18:20:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231331AbhKJRXe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 10 Nov 2021 12:23:34 -0500
Received: from mo4-p03-ob.smtp.rzone.de ([81.169.146.175]:12360 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231129AbhKJRXe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 10 Nov 2021 12:23:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1636564813;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=FUXvSxOapEOXszxLHtIzwAEW82zU3mG7PzhVm47QW28=;
    b=hOoo1qtZdqiqh0qncTFEqLXVBnCuQam5+StailPMtwLwGlJ99HwodaSgkIQnKeeKxY
    dyIZG7QRcGyg8qs57kji2prd3ExawyjgCxHXdea2QSrrbl+Kz1uAXaEMk03AQWj3F6v8
    Sd47QloDE8FAECS9t7YlA7zpZOKTuEMG1ILgtWAnV9Ke7LhRPomi51vkQ5bv67dEqyuS
    /SOiqlDLzGPT6Q/KQBVVl6PU7zcBe4WejmhM1ATjmkfPKLjcnawOOH4CrVkQpRUhctKH
    6Uwm4I1cFCwj7r0qAhU/RQqv0K4gK0AziQ9qrCo816FPi1MjvZnd0UP9a6twOUsI5OsH
    z04g==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHWElw47pgLk="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 47.34.5 DYNA|AUTH)
    with ESMTPSA id Y02aa4xAAHKD521
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Wed, 10 Nov 2021 18:20:13 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v2 4/6] mmc: core: Fixup storing of OCR for
 MMC_QUIRK_NONSTD_SDIO
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <e7936cff7fc24d187ef2680d3b4edb0ade58f293.1636564631.git.hns@goldelico.com>
Date:   Wed, 10 Nov 2021 18:20:12 +0100
Cc:     =?utf-8?Q?Gra=C5=BEvydas_Ignotas?= <notasas@gmail.com>,
        linux-mmc@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        =?utf-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>,
        Avri Altman <avri.altman@wdc.com>,
        Shawn Lin <shawn.lin@rock-chips.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Bean Huo <beanhuo@micron.com>,
        Nikolaus Schaller <hns@goldelico.com>,
        Kiwoong Kim <kwmad.kim@samsung.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Yang Li <abaci-bugfix@linux.alibaba.com>
Content-Transfer-Encoding: 7bit
Message-Id: <857E13BF-020B-4184-801D-783ADBDC42A1@goldelico.com>
References: <cover.1636564631.git.hns@goldelico.com>
 <e7936cff7fc24d187ef2680d3b4edb0ade58f293.1636564631.git.hns@goldelico.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
X-Mailer: Apple Mail (2.3445.104.21)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

> Am 10.11.2021 um 18:17 schrieb H. Nikolaus Schaller <hns@goldelico.com>:
> 
> From: Ulf Hansson <ulf.hansson@linaro.org>
> 
> The mmc core takes a specific path to support initializing of a
> non-standard SDIO card. This is triggered by looking for the card-quirk,
> MMC_QUIRK_NONSTD_SDIO.
> 
> 	if (card->type == MMC_TYPE_SD_COMBO) {
> -- 
> 2.33.0
> 

Sorry, I just recognised after pressing the send button that with "early"
you probably meant this to be 1/6... Should I resubmit?

BR,
Nikolaus


