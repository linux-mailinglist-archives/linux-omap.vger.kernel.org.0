Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD088CEB9B
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2019 20:16:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728031AbfJGSQQ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-omap@lfdr.de>); Mon, 7 Oct 2019 14:16:16 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.163]:9946 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728329AbfJGSQQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Oct 2019 14:16:16 -0400
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmMgw47ty6c="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.28.0 DYNA|AUTH)
        with ESMTPSA id v00409v97IG5qjw
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Mon, 7 Oct 2019 20:16:05 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH RFC] DT support for omap4-iss
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CALcgO_4Usn_OAwiCWpx45+_YRsTKiUpOYs9fCSbUbYjnvmrc-g@mail.gmail.com>
Date:   Mon, 7 Oct 2019 20:16:04 +0200
Cc:     linux-media@vger.kernel.org,
        linux-omap <linux-omap@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com
Content-Transfer-Encoding: 8BIT
Message-Id: <77B9C173-5E61-473D-AA2E-79586B7A9C62@goldelico.com>
References: <CALcgO_6UXp-Xqwim8WpLXz7XWAEpejipR7JNQc0TdH0ETL4JYQ@mail.gmail.com> <20190628110441.42gdqidkg5csuxai@valkosipuli.retiisi.org.uk> <20191007163404.GZ5607@atomide.com> <CALcgO_4Usn_OAwiCWpx45+_YRsTKiUpOYs9fCSbUbYjnvmrc-g@mail.gmail.com>
To:     Michael Allwright <allsey87@gmail.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

> Am 07.10.2019 um 18:56 schrieb Michael Allwright <allsey87@gmail.com>:
> 
> On Mon, 7 Oct 2019 at 18:34, Tony Lindgren <tony@atomide.com> wrote:
>> 
>> Hi,
>> 
>> * Sakari Ailus <sakari.ailus@iki.fi> [190628 11:05]:
>>> Hi Michael,
>>> 
>>> On Mon, Aug 10, 2015 at 05:16:30PM +0200, Michael Allwright wrote:
>>>> Hi All,
>>>> 
>>>> The following PRELIMINARY patch adds DT support to the OMAP4 ISS. It
>>>> also fixes some problems a have found along the way. It is tightly
>>>> modelled after the omap3-isp media platform driver. This patch is a
>>>> work in progress as I would like feedback. It contains debugging
>>>> messages that need to be removed, as well as disgusting abuses of the
>>>> C language as required (i.e. clk_core_fake and clk_fake).
>>> 
>>> We'd like to restart the effort adding DT support for this driver. Would
>>> you be able to, if not address the comments, at least resend your old patch
>>> with your Signed-off-by: line so we could make use of what you've already
>>> done?
>> 
>> I think this email no longer works for Michael? Adding another
>> one from commit at [0] below.
>> 
>> Michael, care to email that patch to the lists with your
>> Signed-off-by so Sakari can use it? Or at least reply with
>> your Signed-off-by to this thread :)
>> 
>> Regards,
>> 
>> Tony
>> 
>> [0] https://github.com/allsey87/meta-builderbot/blob/master/recipes-kernel/linux/linux-stable-4.16/0008-omap4iss-Fix-multiple-bugs-and-use-device-tree.patch
> 
> Hi All,
> 
> Sorry for the lack of communication, indeed the University of Paderborn
> email is no longer used. We ran out of time on our end to work on this.
> Naturally I would be glad to see any efforts towards getting DT support
> together for this driver. To that end, we release all the work we have
> done, including the patch in [0], to the public domain.
> 
> Signed-off-by: Michael Allwright <michael.allwright@ulb.ac.be>

Looks really good and the DTS goes into the same direction
as I had roughly been thinking of. I'll adapt my tree and try
to make it work. As well as do something similar for omap5. But
may need some time.

BR and thanks,
Nikolaus


