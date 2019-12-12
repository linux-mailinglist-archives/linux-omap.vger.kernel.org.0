Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A88411D209
	for <lists+linux-omap@lfdr.de>; Thu, 12 Dec 2019 17:16:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729801AbfLLQQU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Dec 2019 11:16:20 -0500
Received: from muru.com ([72.249.23.125]:46382 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729247AbfLLQQU (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 12 Dec 2019 11:16:20 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id E264480C0;
        Thu, 12 Dec 2019 16:16:58 +0000 (UTC)
Date:   Thu, 12 Dec 2019 08:16:16 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     linux-omap@vger.kernel.org,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Keerthy <j-keerthy@ti.com>
Subject: Re: [PATCH 00/14] Probe am3, am4 and dra7 crypto accelerators with
 ti-sysc
Message-ID: <20191212161616.GS35479@atomide.com>
References: <20191210231722.44215-1-tony@atomide.com>
 <823e559b-8ef4-b6b7-df63-aaefca16a0ab@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <823e559b-8ef4-b6b7-df63-aaefca16a0ab@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tero Kristo <t-kristo@ti.com> [191212 08:21]:
> On 11/12/2019 01:17, Tony Lindgren wrote:
> > Hi,
> > 
> > This series updates crypto accelerators to probe with ti-sysc and device tree
> > data for am3, am4 and dra7.
...

> Gave this a shot on top of 5.5-rc1 + the crypto fixes series on
> am57xx-beagle-x15, using both tcrypt.ko and crypto manager self tests.
> Appears to be working. Also, looked at the patches and they seem fine, so
> for the whole series:
> 
> Tested-by: Tero Kristo <t-kristo@ti.com>
> Reviewed-by: Tero Kristo <t-kristo@ti.com>

OK thanks for testing, good to hear.

Regards,

Tony
