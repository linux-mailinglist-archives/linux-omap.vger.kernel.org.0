Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE48AFCB7B
	for <lists+linux-omap@lfdr.de>; Thu, 14 Nov 2019 18:07:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726717AbfKNRHe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 14 Nov 2019 12:07:34 -0500
Received: from muru.com ([72.249.23.125]:42274 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726592AbfKNRHe (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 14 Nov 2019 12:07:34 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id B958180E7;
        Thu, 14 Nov 2019 17:08:10 +0000 (UTC)
Date:   Thu, 14 Nov 2019 09:07:31 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     linux-omap@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org, Tero Kristo <t-kristo@ti.com>
Subject: Re: [PATCH] bus: ti-sysc: Adjust exception handling in
 sysc_child_add_named_clock()
Message-ID: <20191114170731.GU5610@atomide.com>
References: <8874d0c5-856a-809f-cba6-1b970df68d13@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8874d0c5-856a-809f-cba6-1b970df68d13@web.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Markus Elfring <Markus.Elfring@web.de> [191106 10:22]:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 6 Nov 2019 19:12:30 +0100
> 
> Add a jump target so that a call of the function “clk_put”
> can be better reused at the end of this function.

Thanks applying into omap-for-v5.5/ti-sysc.

Regards,

Tony
