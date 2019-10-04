Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDE68CC049
	for <lists+linux-omap@lfdr.de>; Fri,  4 Oct 2019 18:11:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389910AbfJDQLU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Oct 2019 12:11:20 -0400
Received: from muru.com ([72.249.23.125]:35384 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389835AbfJDQLU (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 4 Oct 2019 12:11:20 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 6D15680BF;
        Fri,  4 Oct 2019 16:11:53 +0000 (UTC)
Date:   Fri, 4 Oct 2019 09:11:17 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: iss: camera interface omap5
Message-ID: <20191004161117.GO5610@atomide.com>
References: <0D08B352-F0DF-45A4-8279-51B07D366AD0@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0D08B352-F0DF-45A4-8279-51B07D366AD0@goldelico.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* H. Nikolaus Schaller <hns@goldelico.com> [191004 07:25]:
> Hi Tony,
> is there a similar node for omap5 comparable to this for omap4:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/omap4.dtsi?h=v5.4-rc1#n176

Not sure if it's the same interface as on omap4, but at
least TRM has "8.1.3.1 ISS Instance Summary" at 0x52000000.

Regards,

Tony
