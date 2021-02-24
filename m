Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFD1A323859
	for <lists+linux-omap@lfdr.de>; Wed, 24 Feb 2021 09:13:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234123AbhBXILz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 24 Feb 2021 03:11:55 -0500
Received: from mail-ej1-f45.google.com ([209.85.218.45]:41746 "EHLO
        mail-ej1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234088AbhBXILs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 24 Feb 2021 03:11:48 -0500
Received: by mail-ej1-f45.google.com with SMTP id lr13so1480396ejb.8;
        Wed, 24 Feb 2021 00:11:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cKcwbmz/5GIyCZkFjA0Zr9oqhuUGRUYNtVSX/VVqwR0=;
        b=Hsw+EtzJRaY8lb2ZjK9P39Jo7jtoWLknzWv4eyhWNO4V11PC6S/yPsS6iEFmIaDBJN
         JM0OJ7ocUMj3yDlmNkipMAdReH6yMw87+JiWSTmh6FFjlFjIUVu4QJiTpU5HEHT3+QQW
         bRDQvgcNi5YDzZk9x628rd9FLZxj7qD0lUgTi0O929KIPN/Oc/FKWloC4FgVykZNPs60
         K8Gw5/ZJDoUJB0Ng/BUhixKVjGGyPOCGd2IwR/VbZPaw4fdA3tNyFtUoj0lcxC4U/Let
         qACLH1E2IUhTVoC5ilwpL1ZuTf1MA+9mkW14CTYNRLezMhW7G9Wol6t7ALqJUs61QCOm
         EcjA==
X-Gm-Message-State: AOAM533IwyO4nwe2dt6P9kKodizpl8LbX9Vk4NiqVOLSFT3kZo4NI8/F
        TLQ1u40D1tPuWlpitNo/SPbeOtRhq+I=
X-Google-Smtp-Source: ABdhPJx5lWuNw74rrR8knAvnqBe3sSDBK9FAf5Xk4b4fiKTq1IQwijVJNRiYHz9x/628/+URRYtWZA==
X-Received: by 2002:a17:906:7d87:: with SMTP id v7mr26685834ejo.214.1614154266284;
        Wed, 24 Feb 2021 00:11:06 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id q2sm854846edv.93.2021.02.24.00.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 00:11:05 -0800 (PST)
Date:   Wed, 24 Feb 2021 09:11:04 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Colin King <colin.king@canonical.com>,
        Roger Quadros <rogerq@kernel.org>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] memory: gpmc: fix out of bounds read and dereference on
 gpmc_cs[]
Message-ID: <20210224081104.rw6amjl6p5so5cq7@kozik-lap>
References: <20210223193821.17232-1-colin.king@canonical.com>
 <20210224075552.GS2087@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210224075552.GS2087@kadam>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Feb 24, 2021 at 10:55:52AM +0300, Dan Carpenter wrote:
> On Tue, Feb 23, 2021 at 07:38:21PM +0000, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > Currently the array gpmc_cs is indexed by cs before it cs is range checked
> > and the pointer read from this out-of-index read is dereferenced. Fix this
> > by performing the range check on cs before the read and the following
> > pointer dereference.
> > 
> > Addresses-Coverity: ("Negative array index read")
> > Fixes: 186401937927 ("memory: gpmc: Move omap gpmc code to live under drivers")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >  drivers/memory/omap-gpmc.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
> > index cfa730cfd145..f80c2ea39ca4 100644
> > --- a/drivers/memory/omap-gpmc.c
> > +++ b/drivers/memory/omap-gpmc.c
> > @@ -1009,8 +1009,8 @@ EXPORT_SYMBOL(gpmc_cs_request);
> >  
> >  void gpmc_cs_free(int cs)
> >  {
> > -	struct gpmc_cs_data *gpmc = &gpmc_cs[cs];
> > -	struct resource *res = &gpmc->mem;
> 
> There is no actual dereferencing going on here, it just taking the
> addresses.  But the patch is also harmless and improves readability.

Hm, in the second line indeed the compiler will just calculate the
offset of "mem" field against the "gpmc_cs+cs" and return it's probable
address.

To me still the code is a little bit non-obvious or obfuscated - first
you play with the array[index] and then you check the validity of index.

Best regards,
Krzysztof

