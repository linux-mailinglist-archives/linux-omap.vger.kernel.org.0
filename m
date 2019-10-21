Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CDF4DF6F9
	for <lists+linux-omap@lfdr.de>; Mon, 21 Oct 2019 22:45:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730065AbfJUUpH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Oct 2019 16:45:07 -0400
Received: from muru.com ([72.249.23.125]:38754 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729406AbfJUUpG (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 21 Oct 2019 16:45:06 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 950C180CC;
        Mon, 21 Oct 2019 20:45:41 +0000 (UTC)
Date:   Mon, 21 Oct 2019 13:45:03 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 10/10] ARM: OMAP2+: Drop legacy platform data for musb on
 omap4
Message-ID: <20191021204503.GH5610@atomide.com>
References: <20191018163220.3504-1-tony@atomide.com>
 <20191018163220.3504-11-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191018163220.3504-11-tony@atomide.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [191018 16:33]:
> We can now probe devices with ti-sysc interconnect driver and dts
> data. Let's drop the related platform data and custom ti,hwmods
> dts property.
> 
> As we're just dropping data, and the early platform data init
> is based on the custom ti,hwmods property, we want to drop both
> the platform data and ti,hwmods property in a single patch.

Turns out the ti-sysc driver is still missing swsup
quirk handling, so this patch has a dependency to:

[PATCH] bus: ti-sysc: Handle mstandby quirk and use it for musb

Regards,

Tony
