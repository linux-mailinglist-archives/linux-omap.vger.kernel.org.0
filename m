Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30DD421DDCC
	for <lists+linux-omap@lfdr.de>; Mon, 13 Jul 2020 18:45:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730149AbgGMQps (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 13 Jul 2020 12:45:48 -0400
Received: from muru.com ([72.249.23.125]:36662 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729593AbgGMQps (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 13 Jul 2020 12:45:48 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id F23588106;
        Mon, 13 Jul 2020 16:45:45 +0000 (UTC)
Date:   Mon, 13 Jul 2020 09:45:45 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     dillon.minfei@gmail.com
Cc:     bcousson@baylibre.com, robh+dt@kernel.org,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: Configure osc clock for d_can on am437x
Message-ID: <20200713164545.GL5849@atomide.com>
References: <1592753641-5205-1-git-send-email-dillon.minfei@gmail.com>
 <1592753641-5205-2-git-send-email-dillon.minfei@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1592753641-5205-2-git-send-email-dillon.minfei@gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* dillon.minfei@gmail.com <dillon.minfei@gmail.com> [200621 15:36]:
> From: dillon min <dillon.minfei@gmail.com>
> 
> Since am437x have the same clock structure with am335x [1][2],
> reuse the code from Tony Lindgren's patch [3] to fix dcan probe
> failed on am437x platform.
> 
> [1]: https://www.ti.com/lit/pdf/spruh73 Chapter-23, Figure 23-1. DCAN
> Integration
> [2]: https://www.ti.com/lit/pdf/spruhl7 Chapter-25, Figure 25-1. DCAN
> Integration
> [3]: commit 516f1117d0fb ("ARM: dts: Configure osc clock for d_can on
> am335x")
> 
> Fixes: 1a5cd7c23cc5 ("bus: ti-sysc: Enable all clocks directly during init to
> read revision")

Thanks applying into fixes.

Tony
