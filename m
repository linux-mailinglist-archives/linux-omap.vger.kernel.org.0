Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F42A11D447
	for <lists+linux-omap@lfdr.de>; Thu, 12 Dec 2019 18:43:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730153AbfLLRm7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Dec 2019 12:42:59 -0500
Received: from muru.com ([72.249.23.125]:46578 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730074AbfLLRm7 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 12 Dec 2019 12:42:59 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 63E1B80C0;
        Thu, 12 Dec 2019 17:43:38 +0000 (UTC)
Date:   Thu, 12 Dec 2019 09:42:56 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Dave Gerlach <d-gerlach@ti.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] ARM: OMAP2+: am43xx: Add lcdc clockdomain
Message-ID: <20191212174256.GG35479@atomide.com>
References: <20191211202558.5988-1-d-gerlach@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191211202558.5988-1-d-gerlach@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Dave Gerlach <d-gerlach@ti.com> [191211 12:25]:
> As described in AM437x TRM, spruhl7h, Revised January 2018, there is
> an LCDC clockdomain present in the PER power domain. Although it is
> entirely unused on AM437x, it should be defined along with the other
> clockdomains so it can be shut off by Linux as there are no users.

Thanks applying into omap-for-v5.6/soc.

Regards,

Tony
