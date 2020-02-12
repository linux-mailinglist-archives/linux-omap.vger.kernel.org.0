Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD1B715AFB0
	for <lists+linux-omap@lfdr.de>; Wed, 12 Feb 2020 19:25:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727279AbgBLSZ5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 12 Feb 2020 13:25:57 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43469 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727054AbgBLSZ5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 12 Feb 2020 13:25:57 -0500
Received: by mail-lj1-f196.google.com with SMTP id a13so3453945ljm.10
        for <linux-omap@vger.kernel.org>; Wed, 12 Feb 2020 10:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sdJy3y/pjaYpYWC4J4QN/ZTkobn3EjGqqaK/ExDj4B8=;
        b=PDl+NqgL/n+cptSpvy3o69nsnQDeFVZK5EcckuzH9CtGJU9MGCvbmo9l1XlFtSY9NP
         PjsnyN6dRhKPnjP0+M0v5Bvbmga87Wqa667VT5KGe13SNrj2vaySsTgqFNRJkBO+jcGS
         1PX3uePvSoDEBBXCHQfZDqxymmTSnSx2UYsL5KJU/hdDtmX3PnWWuyAELrQIXk4zZ0pC
         GZMmLubj2cJJiSAsvBxi0RO+97Zxd8BbkKHfaPqnp7MmP4RuKXZwDEq2WYaKow8je3Xg
         rBie8/l18sE7TqlahXXzNDoeOC45Sa61/4NmdKNBdXsKRlHD1l+MhwOaebh7RoQ2zmD1
         c1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sdJy3y/pjaYpYWC4J4QN/ZTkobn3EjGqqaK/ExDj4B8=;
        b=VS+66/DTTrgsUp13Jp4abI1Lh/SNgwvSSMB5YlSVFYdDKR/eSH6KEG3+ARJ2XA8Qn1
         qpYbHs4XLQmWdh86KdiHYnc1LV6XbsOzsCGKdCYSxeP8ZmWiZBGI8zIEHAgjRaRmDbgo
         3g1iOlU/SCe+YC5hrNYLVKpJIjmbZKkqWf8fM4ttAL/CMnsQxCaH7JC5pFEubkZBcIVe
         A3bEpoN47DA3CUYSdQs7CzUSmw79kFtmhUkpGC+88pWaLa4DbCmw2p+ZKBzi/yjEEfL7
         VKdDVtk/MQsUnTq3iaUdxnba9cPn1bbkg/Q9N7BGKVTSaGGWq1pKWisBZMuBt01SVfuL
         b6Xg==
X-Gm-Message-State: APjAAAXRWvq9d1YFU8AaGLkw0OqnRDAe+NZqpsz23HYWq2SdGFzGqVFP
        ti5jjUAR7o6ecszKcLdgZZod/8w2
X-Google-Smtp-Source: APXvYqwW8lp+R+SCYfdudPq/rEy1BJkdsJzEMeiG2qAC1OaWJKbtuvvqTu29yUSv5jGGKPKIep94DA==
X-Received: by 2002:a2e:5854:: with SMTP id x20mr8026053ljd.287.1581531955333;
        Wed, 12 Feb 2020 10:25:55 -0800 (PST)
Received: from z50.localnet (109241122244.gdansk.vectranet.pl. [109.241.122.244])
        by smtp.gmail.com with ESMTPSA id 14sm669227lfz.47.2020.02.12.10.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2020 10:25:54 -0800 (PST)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-mtd@lists.infradead.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [RFC PATCH 03/14] ARM: OMAP1: ams-delta: Provide board specific partition info
Date:   Wed, 12 Feb 2020 19:25:52 +0100
Message-ID: <4506487.GXAFRqVoOG@z50>
In-Reply-To: <20200212145154.GK64767@atomide.com>
References: <20200212003929.6682-1-jmkrzyszt@gmail.com> <20200212003929.6682-4-jmkrzyszt@gmail.com> <20200212145154.GK64767@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On Wednesday, February 12, 2020 3:51:54 P.M. CET Tony Lindgren wrote:
> * Janusz Krzysztofik <jmkrzyszt@gmail.com> [200212 00:41]:
> > Now as the Amstrad Delta NAND driver supports fetching information on
> > MTD partitions from device platform data, add partition info to the
> > NAND device configuration.
> 
> Fine if you want hardcoded partition info :) Not sure if the partition
> info coming from bootloader is any better either.. Ideally there would
> be a partition table somewhere on the device like we have for disks..

Yeah, but Amstrad didn't provide anything like that, and we may want to get 
convenient access to factory content of the flash.  We might use command line 
for that, though nobody seemed to really like my previous proposal to use 
command line partition info exclusively.

> Anyways, this is best merged together with the mtd patches so:
> 
> Acked-by: Tony Lindgren <tony@atomide.com>

Thanks for your A-b:.  BTW, patch 06/14 also touches the board file and would 
require your acceptance before being merged via mtd, so could you please have 
a look?

Thanks,
Janusz



