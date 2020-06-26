Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4CF820B48C
	for <lists+linux-omap@lfdr.de>; Fri, 26 Jun 2020 17:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725906AbgFZPbY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 26 Jun 2020 11:31:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbgFZPbY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 26 Jun 2020 11:31:24 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6318C03E97A
        for <linux-omap@vger.kernel.org>; Fri, 26 Jun 2020 08:31:23 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id f18so1847418wrs.0
        for <linux-omap@vger.kernel.org>; Fri, 26 Jun 2020 08:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Z79Xn2ytfLRDJlBOWEMRlNKpTQq7eZRoHYN4S12R0hY=;
        b=qsgF+eG5zi88+Xt1pcJnX7+8UFAsvZWpIVBpNbGWK+arUYAqgpvet0eg6Nz6Iamofd
         61kONqQsBjhbukfj/k4BsZASz0CwKVsJ7diQQp5UR4rlnPZEjahQ3hdqLbufRzsdDQNB
         Y5P4pREKRp5lDnKyC+awNz9txTFXqb+TjOD/v9hXEOLQTa88fKiE+oWMb2LDrPpOoDMF
         xGPIrWZmSzs63RV8eFTriV27jvuBjo2XIsBmW8Gb+8wYNXf5tRgWdC3niWtp/mYBvmd8
         9Rg/CU1fzkqsnkiisQsD8dKI8/Q6Aa7tqAKK213r7x+B/iBEoC61W61czbTW9nH7An+d
         1+og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Z79Xn2ytfLRDJlBOWEMRlNKpTQq7eZRoHYN4S12R0hY=;
        b=pl0yWpxnIB3HvCvJ6t7sd+Pcmmj5ZZaZN616knmqiu+JNkGvXjfKZU2OFStoNiYbet
         9Ga1wM20RTXnwjpL/Vbdhgjj3thHn0nsA20rZ6kbANilMaKLQfV4xb8O7YGOO/jzu3ty
         jIFSeTYBb+xg/FzhpgsoFzX9k/b/HUndrQeP228AVac7kfRFuyi7WtqzKRF1Nh2bjNH3
         pQC94AJJUuH975za/3aCJ/pIyY4oIDfRa98EVEkexvJIIHkMV9yDwrr14bX0WdQK19eI
         9KaX4h697YcPgy3LF1WcAeSwAm2VT4+UQ/3A1gtUbZS7lxCQgMATyYKv1kKkjDQoA93u
         vN6Q==
X-Gm-Message-State: AOAM5337lqkWchLBjoDECJJiCcjSNQxsRZne1m8SLYROLdyWuwtMYYdX
        nNO5ek6UPjCVAWuRhlM69JSZgw==
X-Google-Smtp-Source: ABdhPJxWxlkMZnJ8t8xwSYOJAkftwwfg7dvAGODCCccNrSs1Wd3xLYOWg3KAZANF/AkGBiHIOO3zEw==
X-Received: by 2002:adf:8168:: with SMTP id 95mr4443592wrm.104.1593185482649;
        Fri, 26 Jun 2020 08:31:22 -0700 (PDT)
Received: from dell ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id c6sm17193641wma.15.2020.06.26.08.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 08:31:21 -0700 (PDT)
Date:   Fri, 26 Jun 2020 16:31:19 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     lgirdwood@gmail.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Russ Dill <Russ.Dill@ti.com>,
        Keerthy <j-keerthy@ti.com>, AnilKumar Ch <anilkumar@ti.com>,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH 6/9] regulator: tps65217-regulator: Use the returned
 value of tps65217_reg_read()
Message-ID: <20200626153119.GC177734@dell>
References: <20200626065738.93412-1-lee.jones@linaro.org>
 <20200626065738.93412-7-lee.jones@linaro.org>
 <20200626133304.GB5289@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200626133304.GB5289@sirena.org.uk>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, 26 Jun 2020, Mark Brown wrote:

> On Fri, Jun 26, 2020 at 07:57:35AM +0100, Lee Jones wrote:
> 
> > Until now the aforementioned return value has been ignored.
> 
> This is only aforementioned in the subject.
> 
> >  		/* Store default strobe info */
> >  		ret = tps65217_reg_read(tps, regulators[i].bypass_reg, &val);
> > +		if (ret)
> > +			return ret;
> > +
> 
> We should really be logging an error there rather than just returning,
> that way it's a bit more apparent to someone debugging things what went
> wrong if there is actually a problem.

Would you like me to fix that up subsequently?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
