Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 761B31B1F41
	for <lists+linux-omap@lfdr.de>; Tue, 21 Apr 2020 08:53:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725992AbgDUGxp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Apr 2020 02:53:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725926AbgDUGxo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Tue, 21 Apr 2020 02:53:44 -0400
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C826C061A0F;
        Mon, 20 Apr 2020 23:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=fR1NqAKRcDcvju0ewc8DInHgEpyMK6T3//JWLHgIwrs=; b=E5nwg9HRQ3wDFu/t/mct+wWJRS
        iBQv0E1ZY9dliaFMIvhkeU8OQkTnw+6p49qika7cyI5o/LXwjGbXxmXEjGO5m6nCDenrw8cpjxcOq
        juKAyLj4nLjF2Jn8ngSNcZJ9umIRFTN0cK4tbYAkUKNd+n4FCMWODNQDiFrp/btU76oI=;
Received: from p200300ccff1389001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff13:8900:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1jQmmn-0005R2-Jg; Tue, 21 Apr 2020 08:53:38 +0200
Date:   Tue, 21 Apr 2020 08:53:36 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Evgeniy Polyakov <zbr@ioremap.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Adam Ford <aford173@gmail.com>,
        "Andrew F . Davis" <afd@ti.com>, Vignesh R <vigneshr@ti.com>
Subject: Re: [PATCHv3] w1: omap-hdq: Simplify driver with PM runtime
 autosuspend
Message-ID: <20200421085336.32cf8ffe@aktux>
In-Reply-To: <D1A77603-11FB-407F-B480-82C57E742C51@goldelico.com>
References: <20191217004048.46298-1-tony@atomide.com>
        <7B8C7DD9-095B-48FC-9642-695D07B79E97@goldelico.com>
        <20200416184638.GI37466@atomide.com>
        <3197C3F0-DEB9-4221-AFBD-4F2A08C84C4C@goldelico.com>
        <20200417164340.3d9043d1@aktux>
        <6430AF54-849E-456B-8DB0-B4478BBDB78D@goldelico.com>
        <20200417150721.GL37466@atomide.com>
        <8E062482-5D5D-4837-9980-D6C708DD24D4@goldelico.com>
        <20200420150802.GR37466@atomide.com>
        <D1A77603-11FB-407F-B480-82C57E742C51@goldelico.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, 20 Apr 2020 23:11:18 +0200
"H. Nikolaus Schaller" <hns@goldelico.com> wrote:

> Hi Tony,
> 
> > Am 20.04.2020 um 17:08 schrieb Tony Lindgren <tony@atomide.com>:
> > 
> > * H. Nikolaus Schaller <hns@goldelico.com> [200417 21:04]:  
> >> To me it looks as if reading hqd too quickly after omap_hdq_runtime_resume()
> >> may be part of the problem, although it is 0.4 seconds between [   18.355163]
> >> and [   18.745269]. So I am not sure about my interpretation.
> >> 
> >> A different attempt for interpretation may be that trying to read the
> >> slave triggers omap_hdq_runtime_resume() just before doing the
> >> first hdq_read_byte().  
> > 
> > Hmm so I wonder if adding msleep(100) at the end of
> > omap_hdq_runtime_resume() might help?  
> 
> I have tried and initially it did boot and work once.
> But after the second boot/reboot the effect was back.
> 
> This is something I have observed previously, that the issue
> is there in ca. 9 or 10 boot attempts. So I would assume
> some race condition with udev reading the uevent file of the
> bq27xxx bus client and hence through hdq.
> 
> I already had noticed some hqd_read activity right after probing
> success.
> 
> I had also tried to change pm_runtime_set_autosuspend_delay(, 1000)
> with no success. And I tried to call omap_hdq_runtime_resume() at the
> end of probe.
> 
> The only maybe important observation was when I disabled all
> kernel modules except *hdq*.ko and *bq27*.ko. Then I did only
> get an emergency shell so that it is quite similar to the
> scenario Andreas has tested. With this setup it did work.
> 
So I guess without idling uarts?

> I then tried to reenable other kernel modules but the result
> wasn't convincing that it gives a reliable result.
> 
> So I have still no clear indication when the problem occurs and
> when not.
> 
Hmm, last summer I had problems even without that patch reading
temperature while doing umts transfers. Maybe there are some
connections,
maybe not. For that scenario we might have emc issues, thermal problems
or a real kernel problem.

Regards,
Andreas
