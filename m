Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77AFE3B460
	for <lists+linux-omap@lfdr.de>; Mon, 10 Jun 2019 14:10:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389728AbfFJMKU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 10 Jun 2019 08:10:20 -0400
Received: from muru.com ([72.249.23.125]:52532 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389229AbfFJMKU (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 10 Jun 2019 08:10:20 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 85A9780CD;
        Mon, 10 Jun 2019 12:10:40 +0000 (UTC)
Date:   Mon, 10 Jun 2019 05:10:16 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Teresa Remmet <t.remmet@phytec.de>
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Schultz <d.schultz@phytec.de>
Subject: Re: [PATCH 1/7] ARM: dts: am335x phytec boards: Fix cd-gpios active
 level
Message-ID: <20190610121016.GX5447@atomide.com>
References: <1558704003-393769-1-git-send-email-t.remmet@phytec.de>
 <1558704003-393769-2-git-send-email-t.remmet@phytec.de>
 <20190610070732.GU5447@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190610070732.GU5447@atomide.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [190610 07:08]:
> * Teresa Remmet <t.remmet@phytec.de> [190524 06:20]:
> > Active level of the mmc1 cd gpio needs to be low instead of high.
> > Fix PCM-953 and phyBOARD-WEGA.
> 
> Thanks I'll pick this patch into fixes.

And I'll apply the rest of the series into omap-for-v5.3/dt.

Thanks,

Tony
