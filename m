Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4805ACFBC1
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2019 16:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726091AbfJHOAG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Oct 2019 10:00:06 -0400
Received: from muru.com ([72.249.23.125]:35898 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726068AbfJHOAF (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 8 Oct 2019 10:00:05 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id E219F8081;
        Tue,  8 Oct 2019 14:00:38 +0000 (UTC)
Date:   Tue, 8 Oct 2019 07:00:02 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     linux-omap@vger.kernel.org, ssantosh@kernel.org, s-anna@ti.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        p.zabel@pengutronix.de
Subject: Re: [PATCHv8 0/9] soc: ti: add OMAP PRM driver (for reset)
Message-ID: <20191008140002.GY5610@atomide.com>
References: <20191008125544.20679-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191008125544.20679-1-t-kristo@ti.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tero Kristo <t-kristo@ti.com> [191008 05:56]:
> Hi,
> 
> Hopefully this is the final revision of the series. Just a repost of v7
> with the single comment from Philipp fixed, and added reviewed by tags
> from him for couple of the patches.

Santosh, when applying these, can you please provide me an immutable
branch maybe against v5.4-rc1 that I can use as the base for the related
dts changes?

For the whole series where not already done, please feel free to add:

Reviewed-by: Tony Lindgren <tony@atomide.com>
