Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF7912B42D6
	for <lists+linux-omap@lfdr.de>; Mon, 16 Nov 2020 12:31:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728210AbgKPLbG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Nov 2020 06:31:06 -0500
Received: from muru.com ([72.249.23.125]:48548 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726281AbgKPLbF (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 16 Nov 2020 06:31:05 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 1BA7080C8;
        Mon, 16 Nov 2020 11:31:11 +0000 (UTC)
Date:   Mon, 16 Nov 2020 13:31:02 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: dra7: add second SHA instance
Message-ID: <20201116113102.GD26857@atomide.com>
References: <20200907095246.1651-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200907095246.1651-1-t-kristo@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tero Kristo <t-kristo@ti.com> [200907 12:52]:
> DRA7 SoC has two SHA instances, add the missing second one under the
> main dts file.
> 
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
> Hi Tony,
> 
> This patch depends on: https://patchwork.kernel.org/patch/11760193/

Applying this into omap-for-v5.11/dt thanks.

Tony
