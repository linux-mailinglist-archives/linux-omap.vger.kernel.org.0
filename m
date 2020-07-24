Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE6DA22CA25
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jul 2020 18:07:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbgGXQHE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jul 2020 12:07:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728173AbgGXQGp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Jul 2020 12:06:45 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5404CC0619D3
        for <linux-omap@vger.kernel.org>; Fri, 24 Jul 2020 09:06:45 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id r2so3708840wrs.8
        for <linux-omap@vger.kernel.org>; Fri, 24 Jul 2020 09:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=qZJfAhP5RcYiO5VJpoh1/POga8l2SOHIu6lplyiVFBE=;
        b=aqBrJCQFa5B/aBq6qeyTr9fuyyBnA11Wl65/X50Q59SPxPvtajc3QcT3FN60PsABHA
         rt33VA1ynxONlttakPqkagTFx2H/rTB0Xa7GETBkZLm8XcLjHuLFI9vExLBIDA73FGML
         xTJXDudUbujENDQ+jJG0bWhnPoA5Wh8r7GbFAnIGxQXPeDjvlt29JfPpwRiWwi9JZM5P
         H7SQ7Z6+gHhYk+tUXSJnBTtu5FoTG125HjJBPdRRfPiwsQhwdROW+ecDzUAYKP3krH3m
         bdzMeFUS54BAFWV7I/UnKi5t5FBr3EA2WSnvfTmHGsIaHG/8HICHWuQHuWulcl00dRVB
         KcTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=qZJfAhP5RcYiO5VJpoh1/POga8l2SOHIu6lplyiVFBE=;
        b=qL7An4FZhzsXEUSW6pt9hfAlAFynovUWz/Lf41TUfFMYS7i28e+/L9t3xxr4xXO2mZ
         YgBZDbkcCVwUp6r424BOWGyzVxlyeDPtiuZn9278sMbKn8zMuS7uVAQSYqAdZipQf3cY
         E2FdWtXRK8pDtYbddBPzRFxss7LrrFK6rSPyd41T1OPluSW48lNJkfCfHBtyseTxb0Tw
         ERl9iiNhOs8n6zFw8P906Yo+0Lo1qI0QlnLYeVrN3HI6Ms+oycRGRCtvfBsHsvmTfxOu
         G+aCSjzH8QpKaAheZsZ4wxNqjFB2Sv+B1W609hRpHuDrPZlNBTfEtmo8bPNaw7gegciG
         h+SA==
X-Gm-Message-State: AOAM531laq4vsgxZsVbfQGx+AMN0Fy99fWt/vTMhSytOesypZcB/rHy0
        0wfTbjpwnS3IunvMFZ13fAnIyg==
X-Google-Smtp-Source: ABdhPJwm5w0NWI4nXGrF8b8IQJU/6d1yMLwWHQGb8NE9xQmPETxAvZPDq6tlRTseQWlLgJruMEi8wg==
X-Received: by 2002:adf:e486:: with SMTP id i6mr9068152wrm.258.1595606804047;
        Fri, 24 Jul 2020 09:06:44 -0700 (PDT)
Received: from dell ([2.27.167.73])
        by smtp.gmail.com with ESMTPSA id p8sm1927886wrq.9.2020.07.24.09.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 09:06:43 -0700 (PDT)
Date:   Fri, 24 Jul 2020 17:06:41 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        David Lechner <david@lechnology.com>,
        Tony Lindgren <tony@atomide.com>,
        Roger Quadros <rogerq@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v2] mfd: syscon: Use a unique name with regmap_config
Message-ID: <20200724160641.GB1850026@dell>
References: <20200127231208.1443-1-s-anna@ti.com>
 <20200224100037.GK3494@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200224100037.GK3494@dell>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, 24 Feb 2020, Lee Jones wrote:

> On Mon, 27 Jan 2020, Suman Anna wrote:
> 
> > The DT node full name is currently being used in regmap_config
> > which in turn is used to create the regmap debugfs directories.
> > This name however is not guaranteed to be unique and the regmap
> > debugfs registration can fail in the cases where the syscon nodes
> > have the same unit-address but are present in different DT node
> > hierarchies. Replace this logic using the syscon reg resource
> > address instead (inspired from logic used while creating platform
> > devices) to ensure a unique name is given for each syscon.
> > 
> > Signed-off-by: Suman Anna <s-anna@ti.com>
> > ---
> > v2: Fix build warning reported by kbuild test bot
> > v1: https://patchwork.kernel.org/patch/11346363/
> > 
> >  drivers/mfd/syscon.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> Waiting for Arnd to review.

Still waiting for some input from Arnd.

Might be worth submitting a [RESEND].

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
