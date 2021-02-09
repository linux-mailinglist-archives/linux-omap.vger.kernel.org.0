Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A0FE3155AE
	for <lists+linux-omap@lfdr.de>; Tue,  9 Feb 2021 19:14:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233112AbhBISIu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 9 Feb 2021 13:08:50 -0500
Received: from mail-ot1-f45.google.com ([209.85.210.45]:37684 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232869AbhBIR6E (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 9 Feb 2021 12:58:04 -0500
Received: by mail-ot1-f45.google.com with SMTP id h16so526751ote.4;
        Tue, 09 Feb 2021 09:57:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rx7ShcUPlogVwMh8F9HLA13eYp1scqXW4zBNdroxbow=;
        b=VIuQyFdvxaqfnCkDLTonHwqMy9BVX1smsuU9kL/9N/utwmFmtkzi2oFfz9wOUBpTws
         I0SqU0kaSv/6JASQAqsrBpvIHTUGhcUjDnhAeTvT0Pl4syv1bVoiUNwxpdcL3v9LYHIM
         aUWNa1ArlvyOSNRMbfB+giAo4FiwBVhAVMeNcuNkfxXljcmupoUJRS2B42qT0gX2XIWB
         cpbPSq6tTAhQzjQuO+iiaIEgtscFR8N4bl8u1vkxHadxlNGubdAKIw8sP+SC63LqMfy1
         caKZJzFiZXoObhq/mu6Dl+5y92P+1nLBOPYt1xogESNABfMOx3zK3UbmhbNi+x4bQHF8
         LARA==
X-Gm-Message-State: AOAM531EJjtEd2+enUNdAJqHBVWY4ATgEfYJxhBtJkhvtRFkAEVq5mbA
        DXwFODioIBksRXUDBZn1ig==
X-Google-Smtp-Source: ABdhPJxZWAbE8r3r9BYhHIOTrpouC0/edd7g5RLQ1wJcHj+ewmnVr1TqdFf/lWJp489lqcjqYReVBg==
X-Received: by 2002:a9d:1465:: with SMTP id h92mr16534642oth.141.1612893440531;
        Tue, 09 Feb 2021 09:57:20 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r25sm1612283ota.42.2021.02.09.09.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 09:57:19 -0800 (PST)
Received: (nullmailer pid 4041739 invoked by uid 1000);
        Tue, 09 Feb 2021 17:57:18 -0000
Date:   Tue, 9 Feb 2021 11:57:18 -0600
From:   Rob Herring <robh@kernel.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        Marc Zyngier <maz@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, David Lechner <david@lechnology.com>,
        linux-omap@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: irqchip: Add node name to PRUSS INTC
Message-ID: <20210209175718.GA4041654@robh.at.kernel.org>
References: <20210126163251.29468-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210126163251.29468-1-s-anna@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, 26 Jan 2021 10:32:51 -0600, Suman Anna wrote:
> The current PRUSS Interrupt Controller binding doesn't exactly specify
> the convention for the node name. These interrupt-controllers will always
> have a unit address. Update the binding with the '$nodename' using the
> expected generic name, this shall ensure the interrupt-controller.yaml
> is automatically applied to this binding.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
> This patch is a result of the previous discussion at
> https://patchwork.kernel.org/comment/23926133/
> 
>  .../bindings/interrupt-controller/ti,pruss-intc.yaml           | 3 +++
>  1 file changed, 3 insertions(+)
> 

Applied, thanks!
