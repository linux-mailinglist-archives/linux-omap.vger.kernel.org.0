Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25EB2284F42
	for <lists+linux-omap@lfdr.de>; Tue,  6 Oct 2020 17:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725925AbgJFPwK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 6 Oct 2020 11:52:10 -0400
Received: from mail-oo1-f65.google.com ([209.85.161.65]:35206 "EHLO
        mail-oo1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725769AbgJFPwK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 6 Oct 2020 11:52:10 -0400
Received: by mail-oo1-f65.google.com with SMTP id k13so3312004oor.2;
        Tue, 06 Oct 2020 08:52:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qd2VWenNdkoUjW4mVARFepP+CTuJeNLfpPg/bf3IFww=;
        b=Lm27kBN3GyYPmYxaJgj5RcKgQNIcIRUnrXwAJEBSn3qjm64TUAcq2pvCMjTyD5rNYC
         yKwWvmXxmw6Ey/KMvtt3WYTKDi3xeRSq4Mapelx2X842wG4X/IUX/3EjIRYND1nw5cdC
         ekjqXbRN0leTxnWJxwh9zPTbWgRQA71lhGWp+MgDFmOk8T5ZQmcEZnbyjIQV+iIe4RjY
         DoP0BS70arbguHApYKCoqEunwZNsPv7ifIdBKnRaHPfvg0naRrVmeHrzXtavXrhbz7c8
         46zqdFmCgvAvhIYIhXlLS2UQ2V5l/g3fP3eqz3/hLhLauBDm5OcYslI52BCJmDqiY9AA
         omtg==
X-Gm-Message-State: AOAM531LqQFRrdSI6Q2TVHMOk0dgr3yV0NkMxfnL9o/LwI0SpzTgX9ui
        rGPAcM84yXMpOChB7gROiQ==
X-Google-Smtp-Source: ABdhPJz8EXSC07kVYkTQT+Sh7oV75DTlrmp8dNTXcgtbweAOCz5IdvNkMV5EXhVsUv5/T3qA8KtREg==
X-Received: by 2002:a4a:b443:: with SMTP id h3mr3538017ooo.45.1601999528859;
        Tue, 06 Oct 2020 08:52:08 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s1sm1062547otp.14.2020.10.06.08.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 08:52:08 -0700 (PDT)
Received: (nullmailer pid 2298950 invoked by uid 1000);
        Tue, 06 Oct 2020 15:52:07 -0000
Date:   Tue, 6 Oct 2020 10:52:07 -0500
From:   Rob Herring <robh@kernel.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Nishanth Menon <nm@ti.com>, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH -next] dt-bindings: hwlock: omap: Fix warnings with
 k3.yaml
Message-ID: <20201006155207.GA2297951@bogus>
References: <20200928225155.12432-1-s-anna@ti.com>
 <20200930145537.GA2851296@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930145537.GA2851296@bogus>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Sep 30, 2020 at 09:55:37AM -0500, Rob Herring wrote:
> On Mon, Sep 28, 2020 at 05:51:55PM -0500, Suman Anna wrote:
> > Update the AM65x HwSpinlock example to fix couple of warnings
> > that started showing up after the conversion of K3 bindings to
> > YAML format in commit 66e06509aa37 ("dt-bindings: arm: ti:
> > Convert K3 board/soc bindings to DT schema").
> > 
> >  compatible: ['ti,am654'] is not valid under any of the given schemas (Possible causes of the failure):
> >  compatible: ['ti,am654'] is too short
> >  compatible:0: 'ti,am654' is not one of ['ti,am654-evm']
> > 
> > Also, fix one of the node names while at this.
> > 
> > Signed-off-by: Suman Anna <s-anna@ti.com>
> > ---
> >  .../devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml        | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

I guess this isn't dependent on k3.yaml, so I've applied it.

Rob
