Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D2F12DA3D9
	for <lists+linux-omap@lfdr.de>; Tue, 15 Dec 2020 00:01:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441384AbgLNW73 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 14 Dec 2020 17:59:29 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:35864 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731662AbgLNW70 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 14 Dec 2020 17:59:26 -0500
Received: by mail-oi1-f193.google.com with SMTP id 9so14010916oiq.3;
        Mon, 14 Dec 2020 14:59:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FJU+jaQzEtO5duCLwvppA4dJ34gJjhLrozV/fOOF1No=;
        b=qc4mIwSlZDebYe99h1bt7OoNiKzaoUIRFMhvjFutoEmaZR0UdI9jzaiFtc4tq3dUkf
         DoDLOJZkJK7PsbporRWUUMdSyXNJHfxvDHa6mQ0o9NK69hE4xndo+oeeAxN7mHWjfyaF
         aEXwGPdlJiAKk3XyVehOb7QtSVQKvzK7sqcnGJ4GxjKqYVy546I4F1PvRAz5GloVmrja
         nnBLZspWe0BCzLPrfBw2Gy4ELxCzqZlvDF7QomW25QHfXiXnTjAkbaiPuvWIKQ9UWMlH
         /uoHJqxXPoUNjefXSYwpkg92oGiONsq4xiyXZBBhYCqJdDcWEuw5sXuxoZ3XLJKnB33t
         16gA==
X-Gm-Message-State: AOAM530u2BbS3QWzWHmdERQYt1E8uXUMbVblDdKB9TPWacVzwyRQwlrj
        r+kReEGqnSA98YJ40Dhltg==
X-Google-Smtp-Source: ABdhPJxPklj4vRPATchV+so4shDonNm9ZnUmNJFK2LqIHwfhYahU0gsHtGQIDCXRf9GZjTxR8v6q7Q==
X-Received: by 2002:aca:f48b:: with SMTP id s133mr19806622oih.59.1607986724341;
        Mon, 14 Dec 2020 14:58:44 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e1sm4615291oib.11.2020.12.14.14.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 14:58:43 -0800 (PST)
Received: (nullmailer pid 2539817 invoked by uid 1000);
        Mon, 14 Dec 2020 22:58:42 -0000
Date:   Mon, 14 Dec 2020 16:58:42 -0600
From:   Rob Herring <robh@kernel.org>
To:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, s-anna@ti.com, ssantosh@kernel.org,
        linux-remoteproc@vger.kernel.org, lee.jones@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        praneeth@ti.com, rogerq@ti.com
Subject: Re: [PATCH 1/5] dt-bindings: remoteproc: Add PRU consumer bindings
Message-ID: <20201214225842.GA2537432@robh.at.kernel.org>
References: <20201211142933.25784-1-grzegorz.jaszczyk@linaro.org>
 <20201211142933.25784-2-grzegorz.jaszczyk@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201211142933.25784-2-grzegorz.jaszczyk@linaro.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Dec 11, 2020 at 03:29:29PM +0100, Grzegorz Jaszczyk wrote:
> From: Suman Anna <s-anna@ti.com>
> 
> Add a YAML binding document for PRU consumers. The binding includes
> all the common properties that can be used by different PRU consumer
> or application nodes and supported by the PRU remoteproc driver.
> These are used to configure the PRU hardware for specific user
> applications.
> 
> The application nodes themselves should define their own bindings.
> 
> Co-developed-by: Tero Kristo <t-kristo@ti.com>
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Co-developed-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> ---
>  .../bindings/remoteproc/ti,pru-consumer.yaml  | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml b/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
> new file mode 100644
> index 000000000000..2c5c5e2b6159
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/ti,pru-consumer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common TI PRU Consumer Binding
> +
> +maintainers:
> +  - Suman Anna <s-anna@ti.com>
> +
> +description: |
> +  A PRU application/consumer/user node typically uses one or more PRU device
> +  nodes to implement a PRU application/functionality. Each application/client
> +  node would need a reference to at least a PRU node, and optionally define
> +  some properties needed for hardware/firmware configuration. The below
> +  properties are a list of common properties supported by the PRU remoteproc
> +  infrastructure.
> +
> +  The application nodes shall define their own bindings like regular platform
> +  devices, so below are in addition to each node's bindings.
> +
> +properties:
> +  prus:

ti,prus

> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: phandles to the PRU, RTU or Tx_PRU nodes used
> +
> +  firmware-name:
> +    $ref: /schemas/types.yaml#/definitions/string-array
> +    description: |
> +      firmwares for the PRU cores, the default firmware for the core from
> +      the PRU node will be used if not provided. The firmware names should
> +      correspond to the PRU cores listed in the 'prus' property
> +
> +  ti,pruss-gp-mux-sel:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    enum: [0, 1, 2, 3, 4]
> +    description: |
> +      array of values for the GP_MUX_SEL under PRUSS_GPCFG register for a PRU.
> +      This selects the internal muxing scheme for the PRU instance. Values
> +      should correspond to the PRU cores listed in the 'prus' property. The
> +      GP_MUX_SEL setting is a per-slice setting (one setting for PRU0, RTU0,
> +      and Tx_PRU0 on K3 SoCs). Use the same value for all cores within the
> +      same slice in the associative array. If the array size is smaller than
> +      the size of 'prus' property, the default out-of-reset value (0) for the
> +      PRU core is used.
> +
> +required:
> +  - prus
> +
> +dependencies:
> +  firmware-name: [ prus ]
> +  ti,pruss-gp-mux-sel: [ prus ]
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    /* PRU application node example */
> +    pru-app {
> +        prus = <&pru0>, <&pru1>;
> +        firmware-name = "pruss-app-fw0", "pruss-app-fw1";
> +        ti,pruss-gp-mux-sel = <2>, <1>;
> +    };
> -- 
> 2.29.0
> 
