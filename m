Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC9D611AE87
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 15:57:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727477AbfLKO5i (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Dec 2019 09:57:38 -0500
Received: from muru.com ([72.249.23.125]:45536 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727457AbfLKO5h (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 11 Dec 2019 09:57:37 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id DE3F480FA;
        Wed, 11 Dec 2019 14:58:16 +0000 (UTC)
Date:   Wed, 11 Dec 2019 06:57:35 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: WL12/WL18 SDIO Regulator Question
Message-ID: <20191211145735.GQ35479@atomide.com>
References: <CAHCN7xJa3D15b1WGznTMk6Nt4OPC77bnPUyri6knAdJw4D_uHw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7xJa3D15b1WGznTMk6Nt4OPC77bnPUyri6knAdJw4D_uHw@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [191211 14:14]:
> I am not sure where to post this, but a bunch of omap boards uses
> either the WL12 or WL18xx Wireless chips, and I have a generic
> question regarding the 'regulators' we use to set the enable pin on
> the WiFi chips.
> 
> When digging around in the mmc drivers, I found a driver called
> "mmc-pwrseq-simple"
> 
> It appears to do exactly what we want (ie, turn on the WiFi chip)
> without having to create a separate fixed regulator, but it also has
> the added functionality of enabling an external clock signal.
> 
> This mmc-pwrseq-simple driver appears to be referenced from the MMC
> level with the reference like "mmc-pwrseq = <&usdhc1_pwrseq>;" or
> something similar.
> 
> Should we use this type of mechanism instead of the simple regulators
> to enable/disable the WL12 and/or WL18xx chips?  I am not sure of the
> OMAP MMC/SD controller utilizes the "mmc-pwrseq" entry in the node or
> not.

Yes that should work and from what I recall no custom pwrseq handling
is needed. Maybe give it a try and configure the 70 ms enable delay?

Regards,

Tony
