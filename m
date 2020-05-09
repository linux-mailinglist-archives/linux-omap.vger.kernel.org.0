Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D3CC1CC112
	for <lists+linux-omap@lfdr.de>; Sat,  9 May 2020 13:47:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728365AbgEILrZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 9 May 2020 07:47:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726063AbgEILrZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 9 May 2020 07:47:25 -0400
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5301::6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 684D1C061A0C;
        Sat,  9 May 2020 04:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1589024842;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=CnyAW9uMCr42mJ9XRQIidfqlX3YlRpsHNruTNJCl9aY=;
        b=m4Zd9Phc0FqF6wltRJYRqxRS3bQm7jSZtWcqtCEtVi9zflIo9hj570qKgw4nNM8wuL
        RE+4CZ95nA2n9tFv51MzBs7nSZG3xsynd7RiZg1xFjVwrkRBn37jfYJK38EsthBi9I8z
        9sPAGP9ufo3VztFLNTocYLa1tkTydyaHB92EignvpNmC4yU2ziFWsS0B/e8zI+DnI1Ni
        Hg4hmqkTsOl+NcVocRme5sYZWH6Z3uqmgbcxJkcL6YDRyvGMgALzMvPLIMaIpb5iX1F3
        Rg8oxYenwl6fYJty5U66A7mZXm3nYj0TYaNPM5yxOzqwDJ9Af1O9z62dpcMBTVrzoROS
        qtbQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmAvw47pEAA="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
        with ESMTPSA id R0acebw49BlC7kw
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Sat, 9 May 2020 13:47:12 +0200 (CEST)
Subject: Re: [PATCHv3] w1: omap-hdq: Simplify driver with PM runtime autosuspend
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200429213817.GU37466@atomide.com>
Date:   Sat, 9 May 2020 13:47:12 +0200
Cc:     Andreas Kemnade <andreas@kemnade.info>,
        Evgeniy Polyakov <zbr@ioremap.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Adam Ford <aford173@gmail.com>,
        "Andrew F . Davis" <afd@ti.com>, Vignesh R <vigneshr@ti.com>
Content-Transfer-Encoding: 7bit
Message-Id: <313BDBD2-DBF1-44A7-B021-92F1CAC0BC67@goldelico.com>
References: <20200421180220.GB37466@atomide.com> <70F19A6E-7B36-4873-9364-F284A14EE3A0@goldelico.com> <20200421182017.GC37466@atomide.com> <D3E40A6A-39B8-4F3F-9ABC-28EAE8D623A6@goldelico.com> <20200422120418.49a40c75@aktux> <6E3A50D9-0F15-4A56-8C5E-7CDC63E8AF9F@goldelico.com> <A2AC3E81-49B2-4CF2-A7CF-6075AEB1B72D@goldelico.com> <44AD9673-AE02-498F-A5CC-48499DF226E3@goldelico.com> <E8575FE4-4BC2-41B7-B574-339C58D9CB5E@goldelico.com> <891CBD28-3F91-493D-AD80-6575608846A4@goldelico.com> <20200429213817.GU37466@atomide.com>
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

> Am 29.04.2020 um 23:38 schrieb Tony Lindgren <tony@atomide.com>:
> 
> * H. Nikolaus Schaller <hns@goldelico.com> [200429 21:35]:
>> I have reworked the way the spinlocks, setting and resetting
>> of the hdq_irqstatus bits are done and now it works right from
>> start of boot. Without any timeouts or delays.
>> 
>> I am not exactly sure what went wrong, but it seems as if
>> the read is already done when the write interrupt status
>> bit is processed. Then, the old logic did wipe out both
>> bits by hdq_reset_irqstatus() and the read code did timeout
>> because it did not notice that the data had already been
>> available. This may depend on other system activities so
>> that it can explain why other tests didn't reveal it.
>> 
>> omap_hdq_runtime_resume() and omap_hdq_runtime_suspend()
>> also behave fine.
>> 
>> Before I can post something I need to clean up my hacks
>> and add similar fixes to omap_hdq_break() and omap_w1_triplet()
>> where I hope that I don't break those...
> 
> OK good to hear you were able to figure out what is
> going on here.

I have found another small bug and a dev_dbg format weakness
and now it seems to work well even if I remove or reinsert the
battery while read operations are ongoing.

Still I need more time to fix up the patch(es).

BR and thanks,
Nikolaus

