Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38BEA27EB82
	for <lists+linux-omap@lfdr.de>; Wed, 30 Sep 2020 16:55:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730188AbgI3Ozk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 30 Sep 2020 10:55:40 -0400
Received: from mail-ot1-f52.google.com ([209.85.210.52]:36102 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727426AbgI3Ozk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 30 Sep 2020 10:55:40 -0400
Received: by mail-ot1-f52.google.com with SMTP id 60so2103777otw.3;
        Wed, 30 Sep 2020 07:55:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jPAORAkrFyZ367lv0IoFMC2aORY/aaMYkwJJyCN1bP8=;
        b=nxZ/EsVUThSULOXhcDG2rBvIQM7AQiYMNMLgaWNzYcHaNlBnhrJNVKtuTxgpMpeDFn
         p/RJMp8I/xbh3AwRwywdG0WjOpYoRlm5t0zEobE8ny+rD9nPEc+HCX5clqGbpi+raDan
         ugscE0JhfuPF783kezKyIGX6uLUAr3tpLKblwLglTDiCJJgxuRPZIqP0Y3wyhV3MJTeM
         mQOYSORMyMZXqCq5f1E0AtMBSqY9D3z6+ww5av3nEOr7Sr1unD1XSUrKr6Kgs43eaAhN
         2l3hWSQtrqQJxTDsKaYyLuev+joyHRoUp0eE1tSO9LiqHips2gMqdPba2rTYL450L68i
         xv7g==
X-Gm-Message-State: AOAM532E42XRVXRDNqkZKLaFDK55xAfP2CD8fpdefTAxg4Q72WBmTjVh
        E4i6boA6IgyETRuy58274QA3vmIfNHYSsS0=
X-Google-Smtp-Source: ABdhPJw4XUJWDoMHhegeUyWr1FcDEJQe2jfwOTyMUsd7XLyrRcBHLj+PQiDF5GTmqft0sdl9hT7+Ow==
X-Received: by 2002:a05:6830:610:: with SMTP id w16mr1653371oti.353.1601477739000;
        Wed, 30 Sep 2020 07:55:39 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f29sm440483ook.44.2020.09.30.07.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 07:55:38 -0700 (PDT)
Received: (nullmailer pid 2852145 invoked by uid 1000);
        Wed, 30 Sep 2020 14:55:37 -0000
Date:   Wed, 30 Sep 2020 09:55:37 -0500
From:   Rob Herring <robh@kernel.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Nishanth Menon <nm@ti.com>, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH -next] dt-bindings: hwlock: omap: Fix warnings with
 k3.yaml
Message-ID: <20200930145537.GA2851296@bogus>
References: <20200928225155.12432-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200928225155.12432-1-s-anna@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Sep 28, 2020 at 05:51:55PM -0500, Suman Anna wrote:
> Update the AM65x HwSpinlock example to fix couple of warnings
> that started showing up after the conversion of K3 bindings to
> YAML format in commit 66e06509aa37 ("dt-bindings: arm: ti:
> Convert K3 board/soc bindings to DT schema").
> 
>  compatible: ['ti,am654'] is not valid under any of the given schemas (Possible causes of the failure):
>  compatible: ['ti,am654'] is too short
>  compatible:0: 'ti,am654' is not one of ['ti,am654-evm']
> 
> Also, fix one of the node names while at this.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
>  .../devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml        | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
