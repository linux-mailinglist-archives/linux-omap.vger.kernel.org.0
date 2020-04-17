Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2C031ADFAA
	for <lists+linux-omap@lfdr.de>; Fri, 17 Apr 2020 16:21:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725953AbgDQOVT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 17 Apr 2020 10:21:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbgDQOVT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 17 Apr 2020 10:21:19 -0400
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5302::7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9109C061A0C;
        Fri, 17 Apr 2020 07:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587133277;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=7kjhvy86KZzZOuUOpUtvnjFtfnnF8Cv7o7DriQuJiC4=;
        b=AdY1FakQVUpLcJ6kwEI7w6cpYt9OTc7N5UBvt+Lmn7ieBFSw11p/UEfpzmluz0KJn2
        l90R3DaUH4LRINJ+8/huctH4/KqbB+PaAycJdB4P7OIr/qdGhZvIPd/yZr27N+HO2uad
        PyuDKbVnNbSuuWDCvZynqkSeZ+sZYVICXdM9lQKacyU7Abd4wp1ZoVnW0nRcyV06R1S6
        X5xxjoFLMe4LKAubpHFf0fgM8CTSvtUcOE6lDM0n4XlPrg8O9ex/rXRyTcaWBpN+auNt
        3//HQZ9YLv2emyZtWwMZA6MeLTTxVS/rYKfoO73wvuochH9I2pm7QYhJr87P8kN4MK+6
        LAGQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/PgwDWjbQ=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.5.0 DYNA|AUTH)
        with ESMTPSA id g06d2dw3HEL529h
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Fri, 17 Apr 2020 16:21:05 +0200 (CEST)
Subject: Re: [PATCHv3] w1: omap-hdq: Simplify driver with PM runtime autosuspend
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200416203309.GK37466@atomide.com>
Date:   Fri, 17 Apr 2020 16:21:05 +0200
Cc:     Andreas Kemnade <andreas@kemnade.info>,
        Evgeniy Polyakov <zbr@ioremap.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        Adam Ford <aford173@gmail.com>,
        "Andrew F . Davis" <afd@ti.com>, Vignesh R <vigneshr@ti.com>
Content-Transfer-Encoding: 7bit
Message-Id: <C47EC6CB-CB84-4F48-994D-01DA4DB44426@goldelico.com>
References: <20191217004048.46298-1-tony@atomide.com> <7B8C7DD9-095B-48FC-9642-695D07B79E97@goldelico.com> <20200416184638.GI37466@atomide.com> <20200416220449.17068b21@aktux> <20200416203309.GK37466@atomide.com>
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 16.04.2020 um 22:33 schrieb Tony Lindgren <tony@atomide.com>:
> 
> * Andreas Kemnade <andreas@kemnade.info> [200416 20:05]:
>> On Thu, 16 Apr 2020 11:46:38 -0700
>> Tony Lindgren <tony@atomide.com> wrote:
>>> If that helps, likely we have a missing pm_runtime_get_sync()
>>> somewhere in the driver.
>>> 
>> I have not tested yet with v5.7-rc1 (it is compiling right now),
>> but I have not seen any problems with init=/bin/bash on v5.6
>> and only a minimal set of modules loaded on gta04. I have seen that
>> 42 for IDLEST
> 
> Yeah I think you did test this change on gta04 earlier based
> on the Tested-by from you :)

I think Andreas may have simply missed my test situation.

> 
>> So might be something a bit more weird.
> 
> OK please let us know what you find out.
> 
> Regards,
> 
> Tony

