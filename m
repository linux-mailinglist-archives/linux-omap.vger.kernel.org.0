Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 105629D3DB
	for <lists+linux-omap@lfdr.de>; Mon, 26 Aug 2019 18:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732751AbfHZQUy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Aug 2019 12:20:54 -0400
Received: from muru.com ([72.249.23.125]:58696 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730327AbfHZQUx (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 26 Aug 2019 12:20:53 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 2F6C080AA;
        Mon, 26 Aug 2019 16:21:22 +0000 (UTC)
Date:   Mon, 26 Aug 2019 09:20:50 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Kishore Kadiyala <kishore.kadiyala@ti.com>,
        Russell King <linux@armlinux.org.uk>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org, Balaji T K <balajitk@ti.com>,
        Benoit Cousson <b-cousson@ti.com>,
        Paul Walmsley <paul@pwsan.com>
Subject: Re: [PATCH] ARM: OMAP2+: Delete an unnecessary kfree() call in
 omap_hsmmc_pdata_init()
Message-ID: <20190826162050.GX52127@atomide.com>
References: <69025c8c-8d84-6686-138b-cde59467b802@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69025c8c-8d84-6686-138b-cde59467b802@web.de>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Markus Elfring <Markus.Elfring@web.de> [190826 06:31]:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 26 Aug 2019 15:05:31 +0200
> 
> A null pointer would be passed to a call of the function "kfree" directly
> after a call of the function "kzalloc" failed at one place.
> Remove this superfluous function call.
> 
> This issue was detected by using the Coccinelle software.

Applying into omap-for-v5.4/soc thanks.

Tony
