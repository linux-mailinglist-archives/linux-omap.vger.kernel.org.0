Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8215D3D70CE
	for <lists+linux-omap@lfdr.de>; Tue, 27 Jul 2021 10:07:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235679AbhG0IGS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Jul 2021 04:06:18 -0400
Received: from muru.com ([72.249.23.125]:55542 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235918AbhG0IGA (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 27 Jul 2021 04:06:00 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 79CA780F0;
        Tue, 27 Jul 2021 08:06:18 +0000 (UTC)
Date:   Tue, 27 Jul 2021 11:05:59 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Kevin Hilman <khilman@baylibre.com>
Cc:     linux-omap@vger.kernel.org
Subject: Re: [PATCH] bus: ti-sysc: AM3: RNG is GP only
Message-ID: <YP++Z/AJ2qFG+GUF@atomide.com>
References: <20210720182716.13269-1-khilman@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210720182716.13269-1-khilman@baylibre.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Kevin Hilman <khilman@baylibre.com> [210720 21:28]:
> Make the RNG on AM3 GP only.
> 
> Based on this patch from TI v5.4 tree which is based on hwmod data
> which are now removed:
> 
> | ARM: AM43xx: hwmod: Move RNG to a GP only links table
> |
> | On non-GP devices the RNG is controlled by the secure-side software,
> | like in DRA7xx hwmod we should not control this IP when we are not
> | a GP device.
> |
> | Signed-off-by: Andrew F. Davis <afd@ti.com>
> 
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> ---
> If this is merged, it should be flagged for stable v5.10+. 

Applying into fixes with a stable tag thanks.

Tony
