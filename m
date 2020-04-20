Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AC6A1B181A
	for <lists+linux-omap@lfdr.de>; Mon, 20 Apr 2020 23:11:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbgDTVLf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 20 Apr 2020 17:11:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726758AbgDTVLf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Mon, 20 Apr 2020 17:11:35 -0400
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5301::11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 927D0C061A0C;
        Mon, 20 Apr 2020 14:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587417092;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=VM/1mpb9W6dJV54ZyNTgXDXYYRn4ff5iJpVvPcwV7tQ=;
        b=V3DbmNB+/2OzYcD/ksfoGgU7TCUJp4yy6gYorp2RklGUGtZ4VE9hYISqfMMZ96PLeU
        bI/JcsnrPG62syMuTnEnhYOVCMrKI45vfQejkc5gi7twVmG/ILKdrxccdFwLwE1EFMY5
        mD5zziwKj+jg75hORSUFS2zPOQopCRZamvggfUgA9TPPUDW1kNed7eJM0uy1zYETdzcr
        XiqE7p7q5vPGj4cu3agEejnMcAF629x057HJqPI3TsTLga2xVS4clfh8sAr9n1qdb/tM
        AL8JrjW/aR+bLoAUuLHCvXCcr7Mxh/eEuccPcc7enXkm12ZEVqu/z825zgf0ZVYm7Xk/
        Ojeg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlWeXA4LPg=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.5.0 DYNA|AUTH)
        with ESMTPSA id g06d2dw3KLBJF0M
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Mon, 20 Apr 2020 23:11:19 +0200 (CEST)
Subject: Re: [PATCHv3] w1: omap-hdq: Simplify driver with PM runtime autosuspend
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200420150802.GR37466@atomide.com>
Date:   Mon, 20 Apr 2020 23:11:18 +0200
Cc:     Andreas Kemnade <andreas@kemnade.info>,
        Evgeniy Polyakov <zbr@ioremap.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Adam Ford <aford173@gmail.com>,
        "Andrew F . Davis" <afd@ti.com>, Vignesh R <vigneshr@ti.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D1A77603-11FB-407F-B480-82C57E742C51@goldelico.com>
References: <20191217004048.46298-1-tony@atomide.com> <7B8C7DD9-095B-48FC-9642-695D07B79E97@goldelico.com> <20200416184638.GI37466@atomide.com> <3197C3F0-DEB9-4221-AFBD-4F2A08C84C4C@goldelico.com> <20200417164340.3d9043d1@aktux> <6430AF54-849E-456B-8DB0-B4478BBDB78D@goldelico.com> <20200417150721.GL37466@atomide.com> <8E062482-5D5D-4837-9980-D6C708DD24D4@goldelico.com> <20200420150802.GR37466@atomide.com>
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

> Am 20.04.2020 um 17:08 schrieb Tony Lindgren <tony@atomide.com>:
>=20
> * H. Nikolaus Schaller <hns@goldelico.com> [200417 21:04]:
>> To me it looks as if reading hqd too quickly after =
omap_hdq_runtime_resume()
>> may be part of the problem, although it is 0.4 seconds between [   =
18.355163]
>> and [   18.745269]. So I am not sure about my interpretation.
>>=20
>> A different attempt for interpretation may be that trying to read the
>> slave triggers omap_hdq_runtime_resume() just before doing the
>> first hdq_read_byte().
>=20
> Hmm so I wonder if adding msleep(100) at the end of
> omap_hdq_runtime_resume() might help?

I have tried and initially it did boot and work once.
But after the second boot/reboot the effect was back.

This is something I have observed previously, that the issue
is there in ca. 9 or 10 boot attempts. So I would assume
some race condition with udev reading the uevent file of the
bq27xxx bus client and hence through hdq.

I already had noticed some hqd_read activity right after probing
success.

I had also tried to change pm_runtime_set_autosuspend_delay(, 1000)
with no success. And I tried to call omap_hdq_runtime_resume() at the
end of probe.

The only maybe important observation was when I disabled all
kernel modules except *hdq*.ko and *bq27*.ko. Then I did only
get an emergency shell so that it is quite similar to the
scenario Andreas has tested. With this setup it did work.

I then tried to reenable other kernel modules but the result
wasn't convincing that it gives a reliable result.

So I have still no clear indication when the problem occurs and
when not.

BR and thanks,
Nikolaus



