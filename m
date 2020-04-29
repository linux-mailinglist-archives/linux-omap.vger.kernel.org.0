Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA0671BE9F5
	for <lists+linux-omap@lfdr.de>; Wed, 29 Apr 2020 23:34:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbgD2VeP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 29 Apr 2020 17:34:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726511AbgD2VeP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Wed, 29 Apr 2020 17:34:15 -0400
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5301::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D46E6C03C1AE;
        Wed, 29 Apr 2020 14:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1588196052;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=APYsrPKLpxWrEqgNU863cTg+ycwDHFE8CKynHgQnywo=;
        b=KSj5SecTJLl+K4JgUgvaqKUC0QzrdzGyTV9i10tWK5DfV0YbIRki8KPas2S6dUBGR+
        71iVcviOdJAkHhVpuC09LhDiWeEH+HuwUafTkInwCEMvSJKowqAMgUT26a/Nu4ePHKrn
        Od3GckUmSC9hcfoZ+7Y1EDkBl5JbeyuHoozfUU/8LnVsowoBYSycMSdJ+bSABhK2+cwY
        7ruhUpBKRqcPwqEeJpARdWNpOPRb4fzmuEBG2jI1SEiMS1LuHeKrUQcaok4Ejs8CTISh
        ZlE7CU+J4uR4F1djqs6y1fhalMmrJJVgRG7rPHqXquG8T3TzGtmMTkXeOj/D+ILtsrCX
        T3Gw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGHPrvwDWuZw=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
        with ESMTPSA id R0acebw3TLY1W3U
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 29 Apr 2020 23:34:01 +0200 (CEST)
Subject: Re: [PATCHv3] w1: omap-hdq: Simplify driver with PM runtime autosuspend
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <E8575FE4-4BC2-41B7-B574-339C58D9CB5E@goldelico.com>
Date:   Wed, 29 Apr 2020 23:34:00 +0200
Cc:     Evgeniy Polyakov <zbr@ioremap.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Adam Ford <aford173@gmail.com>,
        "Andrew F . Davis" <afd@ti.com>, Vignesh R <vigneshr@ti.com>
Content-Transfer-Encoding: 7bit
Message-Id: <891CBD28-3F91-493D-AD80-6575608846A4@goldelico.com>
References: <3197C3F0-DEB9-4221-AFBD-4F2A08C84C4C@goldelico.com> <20200417164340.3d9043d1@aktux> <6430AF54-849E-456B-8DB0-B4478BBDB78D@goldelico.com> <20200417150721.GL37466@atomide.com> <8E062482-5D5D-4837-9980-D6C708DD24D4@goldelico.com> <20200420150802.GR37466@atomide.com> <D1A77603-11FB-407F-B480-82C57E742C51@goldelico.com> <20200421085336.32cf8ffe@aktux> <20200421180220.GB37466@atomide.com> <70F19A6E-7B36-4873-9364-F284A14EE3A0@goldelico.com> <20200421182017.GC37466@atomide.com> <D3E40A6A-39B8-4F3F-9ABC-28EAE8D623A6@goldelico.com> <20200422120418.49a40c75@aktux> <6E3A50D9-0F15-4A56-8C5E-7CDC63E8AF9F@goldelico.com> <A2AC3E81-49B2-4CF2-A7CF-6075AEB1B72D@goldelico.com> <44AD9673-AE02-498F-A5CC-48499DF226E3@goldelico.com> <E8575FE4-4BC2-41B7-B574-339C58D9CB5E@goldelico.com>
To:     Andreas Kemnade <andreas@kemnade.info>,
        Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

> Am 25.04.2020 um 12:37 schrieb H. Nikolaus Schaller <hns@goldelico.com>:
> 
> 
>> Am 25.04.2020 um 12:29 schrieb H. Nikolaus Schaller <hns@goldelico.com>:
>> 
>> H
>> The things start to get "fixed" when the hdq_isr
>> jumps to 6 indicating
>> 
>> OMAP_HDQ_INT_STATUS_RXCOMPLETE | OMAP_HDQ_INT_STATUS_TXCOMPLETE
>> 
>> So I am getting more inclined to believe that it is
>> not a power management issue but some piggybacked
>> change to how interrupts are handled.
>> Especially hdq_reset_irqstatus.
>> 
>> So I will add a printk to hdq_reset_irqstatus
>> to see what value it had before being reset.
> 
> I now did check the log during boot and there is the
> reverse situation. Initially it works but suddenly
> hdq_isr becomes 6 and then trouble starts.
> 
> So the key problem is that both, the RX and the TX
> interrupts may be set and then, the code resets
> everything to 0 and looses either one.
> 
> I wonder if that is an issue by two processes reading
> hdq in parallel.
> 
> Another question is how independent command-writes + result-reads
> are properly serialized and locked so that they don't overlap?

I have reworked the way the spinlocks, setting and resetting
of the hdq_irqstatus bits are done and now it works right from
start of boot. Without any timeouts or delays.

I am not exactly sure what went wrong, but it seems as if
the read is already done when the write interrupt status
bit is processed. Then, the old logic did wipe out both
bits by hdq_reset_irqstatus() and the read code did timeout
because it did not notice that the data had already been
available. This may depend on other system activities so
that it can explain why other tests didn't reveal it.

omap_hdq_runtime_resume() and omap_hdq_runtime_suspend()
also behave fine.

Before I can post something I need to clean up my hacks
and add similar fixes to omap_hdq_break() and omap_w1_triplet()
where I hope that I don't break those...

BR and thanks,
Nikolaus

