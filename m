Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CA7143BC73
	for <lists+linux-omap@lfdr.de>; Tue, 26 Oct 2021 23:33:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239643AbhJZVfx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 Oct 2021 17:35:53 -0400
Received: from mail-oi1-f172.google.com ([209.85.167.172]:39910 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237275AbhJZVfw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 26 Oct 2021 17:35:52 -0400
Received: by mail-oi1-f172.google.com with SMTP id s9so560911oiw.6;
        Tue, 26 Oct 2021 14:33:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=q5ipuM9JztsEYfEdCfwiDc6VyfHQLb5SVFaXPyhJGCE=;
        b=qeaV7FuDCsKWWxJj3cFbn07yJRHixB/1dSNiosURSLD9i8KJ/qg2mJ2HWJ4QncfKVR
         nedxzaBBMHcQ6XsHvprRH0TX7i8Ym+UqoPXft8j27sBTxlg76ajy8QmzP4rV6uKBwrlD
         Ok/AsifCFyoGFRD02xo04EoG/dg7PF3Paz3M5uK5RCbpOLmJOQbGqTvq5jdscdfc8aYN
         TxYxltisvBzBYXBmWLcCycJWBu5ahexfKvUPwZ6PC5A555j6PAlcYe9l5lP9lIo2BENg
         z725nv95V1fTUR7u3CNvoG6PtqXRggWghP2A7vbHT+/gj6JmulciWnKd6VB+yBiJwA/G
         I/gg==
X-Gm-Message-State: AOAM533tZAVggPSrG+fo2x+0hE4tklP9tn2R3nh5FSsKN47Tv8S5d+sN
        Px0s+5aR3zeu9HrR9vSlPw==
X-Google-Smtp-Source: ABdhPJwX/o2BKh61aO10pJ8j2Igz1nCJ9i6GDWL95opy4gu85HlenUnPT8sohds/u9p8HlRSJ5UN4g==
X-Received: by 2002:a54:4d89:: with SMTP id y9mr979301oix.22.1635284008112;
        Tue, 26 Oct 2021 14:33:28 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id b9sm4891096ots.77.2021.10.26.14.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 14:33:27 -0700 (PDT)
Received: (nullmailer pid 3296251 invoked by uid 1000);
        Tue, 26 Oct 2021 21:33:26 -0000
Date:   Tue, 26 Oct 2021 16:33:26 -0500
From:   Rob Herring <robh@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Suman Anna <s-anna@ti.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: Re: [PATCHv2] dt-bindings: bus: ti-sysc: Update to use yaml binding
Message-ID: <YXh0JtEnB6uKR/my@robh.at.kernel.org>
References: <20211015113350.35830-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211015113350.35830-1-tony@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, 15 Oct 2021 14:33:50 +0300, Tony Lindgren wrote:
> Update the binding for ti-sysc interconnect target module driver to yaml
> format.
> 
> Note that the old binding was never updated for the need to always specify
> also the generic compatible "ti,sysc". This is needed for the auxdata
> for platform clockdomain autoidle related functions.
> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: Suman Anna <s-anna@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
> 
> Changes since v1:
> 
> - Update based on comments from Rob
> 
> ---
>  .../devicetree/bindings/bus/ti-sysc.txt       | 139 ----------
>  .../devicetree/bindings/bus/ti-sysc.yaml      | 242 ++++++++++++++++++
>  2 files changed, 242 insertions(+), 139 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/bus/ti-sysc.txt
>  create mode 100644 Documentation/devicetree/bindings/bus/ti-sysc.yaml
> 

I reworked the reg-names and clock-names to be more concise and applied. 
Like this:

  clock-names:
    description:
      Target module clock names like "fck", "ick", "optck1", "optck2"
      if the clocks are configurable.
    oneOf:
      - enum: [ ick, fck, sys_clk ]
      - items:
          - const: fck
          - enum: [ ick. dbclk, osc, sys_clk, dss_clk, ahclkx ]
      - items:
          - const: fck
          - const: phy-clk
          - const: phy-clk-div
      - items:
          - const: fck
          - const: hdmi_clk
          - const: sys_clk
          - const: tv_clk
      - items:
          - const: fck
          - const: ahclkx
          - const: ahclkr

