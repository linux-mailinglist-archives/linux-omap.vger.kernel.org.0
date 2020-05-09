Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C302E1CC1F9
	for <lists+linux-omap@lfdr.de>; Sat,  9 May 2020 15:59:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbgEIN7k (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 9 May 2020 09:59:40 -0400
Received: from muru.com ([72.249.23.125]:53678 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726904AbgEIN7k (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 9 May 2020 09:59:40 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 41A49809C;
        Sat,  9 May 2020 14:00:29 +0000 (UTC)
Date:   Sat, 9 May 2020 06:59:37 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Andreas Kemnade <andreas@kemnade.info>,
        Evgeniy Polyakov <zbr@ioremap.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Adam Ford <aford173@gmail.com>,
        "Andrew F . Davis" <afd@ti.com>, Vignesh R <vigneshr@ti.com>
Subject: Re: [PATCHv3] w1: omap-hdq: Simplify driver with PM runtime
 autosuspend
Message-ID: <20200509135937.GB37466@atomide.com>
References: <20200421182017.GC37466@atomide.com>
 <D3E40A6A-39B8-4F3F-9ABC-28EAE8D623A6@goldelico.com>
 <20200422120418.49a40c75@aktux>
 <6E3A50D9-0F15-4A56-8C5E-7CDC63E8AF9F@goldelico.com>
 <A2AC3E81-49B2-4CF2-A7CF-6075AEB1B72D@goldelico.com>
 <44AD9673-AE02-498F-A5CC-48499DF226E3@goldelico.com>
 <E8575FE4-4BC2-41B7-B574-339C58D9CB5E@goldelico.com>
 <891CBD28-3F91-493D-AD80-6575608846A4@goldelico.com>
 <20200429213817.GU37466@atomide.com>
 <313BDBD2-DBF1-44A7-B021-92F1CAC0BC67@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <313BDBD2-DBF1-44A7-B021-92F1CAC0BC67@goldelico.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* H. Nikolaus Schaller <hns@goldelico.com> [200509 11:48]:
> I have found another small bug and a dev_dbg format weakness
> and now it seems to work well even if I remove or reinsert the
> battery while read operations are ongoing.

OK great.

> Still I need more time to fix up the patch(es).

Well it's ready when it's ready :)

Tony
