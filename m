Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 572A0159EEF
	for <lists+linux-omap@lfdr.de>; Wed, 12 Feb 2020 03:06:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727636AbgBLCG4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 11 Feb 2020 21:06:56 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:41704 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727007AbgBLCGz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 11 Feb 2020 21:06:55 -0500
Received: by mail-oi1-f195.google.com with SMTP id i1so520014oie.8;
        Tue, 11 Feb 2020 18:06:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tVXjPjxR9wTAQLJNH5T7mUhjsaEtPI+g7h5Obb2jWnE=;
        b=VGUefA5ms/wVUzLX4GqnQMVWPuyhylNRL6MVibCxlT4tFErgfTxL/tz5R4JbM/kPLN
         cXPI0n7RfeeQYxepmLSCTjLk5Psz0W4uJmHmDd+PJ0tG5l/6aU6HgfbUQM4J8uzas34L
         C8fFLI1Y39dFWkcUv3Z8Fb7GhoKpGCJ2v4T67g/OvLqASETPLPrx546wOC2ohAp6yhGv
         GIwG5Opav0fykrguET1zRIVNLwb7W+dakf7peIRETuiACmid/49mfl0hMqtOFeBi4pws
         o6FWFW5eUZmmf9sh81IZUfhSTSFvgVeBNld9IpTK7tHVvjXx3o9tjor0+yS+xrsmwBPX
         oo4w==
X-Gm-Message-State: APjAAAX0uvash15Amd4YfusYR21RmVstVLOdvLv57hTQqb6dNnWFjqsC
        GPRMH0fWCC42ngP19XEhYhUhY1c=
X-Google-Smtp-Source: APXvYqybQ/XV/KhEd/2JUE85p1PXN4bVy5ZMAraDqMTKCuVg5SpphZnA98DtlRuWcuJmCzIfBzRiMQ==
X-Received: by 2002:aca:1708:: with SMTP id j8mr4794797oii.166.1581473214862;
        Tue, 11 Feb 2020 18:06:54 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 32sm1871958ott.38.2020.02.11.18.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 18:06:54 -0800 (PST)
Received: (nullmailer pid 29491 invoked by uid 1000);
        Wed, 12 Feb 2020 02:06:53 -0000
Date:   Tue, 11 Feb 2020 20:06:53 -0600
From:   Rob Herring <robh@kernel.org>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, afd@ti.com,
        linux-kernel@vger.kernel.org, mathieu.poirier@linaro.org,
        linux-omap@vger.kernel.org, Suman Anna <s-anna@ti.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCHv6 RESEND 01/14] dt-bindings: remoteproc: Add OMAP
 remoteproc bindings
Message-ID: <20200212020653.GA27019@bogus>
References: <20200211152125.23819-2-t-kristo@ti.com>
 <20200211153313.24072-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200211153313.24072-1-t-kristo@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Feb 11, 2020 at 05:33:13PM +0200, Tero Kristo wrote:
> From: Suman Anna <s-anna@ti.com>
> 
> Add the device tree bindings document for the IPU and DSP
> remote processor devices on OMAP4+ SoCs.
> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Suman Anna <s-anna@ti.com>
> [t-kristo@ti.com: converted to schema]
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
> Quick resend. Missed adding Rob+DT list in CC, git is too clever to get rid of
> CC fields automatically...
> 
> v6: made memory-regions property optional

Small enough change to keep my R-by.

Reviewed-by: Rob Herring <robh@kernel.org>

> 
>  .../remoteproc/ti,omap-remoteproc.yaml        | 321 ++++++++++++++++++
>  1 file changed, 321 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.yaml
