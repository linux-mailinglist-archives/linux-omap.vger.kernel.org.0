Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89DB41707CF
	for <lists+linux-omap@lfdr.de>; Wed, 26 Feb 2020 19:37:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727105AbgBZSh2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 Feb 2020 13:37:28 -0500
Received: from muru.com ([72.249.23.125]:57858 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726878AbgBZSh2 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 26 Feb 2020 13:37:28 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 7F1C08022;
        Wed, 26 Feb 2020 18:38:12 +0000 (UTC)
Date:   Wed, 26 Feb 2020 10:37:24 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Faiz Abbas <faiz_abbas@ti.com>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, vigneshr@ti.com, j-keerthy@ti.com,
        lokeshvutla@ti.com, mark.rutland@arm.com, robh+dt@kernel.org,
        bcousson@baylibre.com
Subject: Re: [PATCH] arm: dts: dra76x: Fix mmc3 max-frequency
Message-ID: <20200226183724.GX37466@atomide.com>
References: <20200128134759.21134-1-faiz_abbas@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200128134759.21134-1-faiz_abbas@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Faiz Abbas <faiz_abbas@ti.com> [200128 05:47]:
> dra76x is not affected by i887 which requires mmc3 node to be limited to
> a max frequency of 64 MHz. Fix this by overwriting the correct value in
> the the dra76 specific dtsi.
> 
> Fixes: 895bd4b3e5ec ("ARM: dts: Add support for dra76-evm")

Sorry looks like I missed this earlier, applying into fixes.

Thanks,

Tony
