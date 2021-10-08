Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F845426286
	for <lists+linux-omap@lfdr.de>; Fri,  8 Oct 2021 04:46:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241354AbhJHCsX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Oct 2021 22:48:23 -0400
Received: from mail-ot1-f41.google.com ([209.85.210.41]:36383 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231928AbhJHCsO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 Oct 2021 22:48:14 -0400
Received: by mail-ot1-f41.google.com with SMTP id 5-20020a9d0685000000b0054706d7b8e5so10001691otx.3;
        Thu, 07 Oct 2021 19:46:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=Zcjj5xjNcu3yBSi1V0zjT4XwOHiWirc0eie6sMutm3Q=;
        b=WXduVdpRzX+wXq8LZ8SXMEzEEEL2vp98m5FSNAI9ZbBAjmNgZqA16mDBiZ172QsXA+
         KGNibQApWfNHO2bHJoSceJz+oAxy1cmeOvhBV0DT5wNkeAaLQb70+LzjkTNIBDsCATCm
         rMDSOBFWbnF48srmBWzUZEP9mr3zHuFqt/InNhTf9d2Rv8XJxT0rbcQ5bffKjvzhMFk7
         r4tXz3yKb/cIhXZOxgq7E5rzeXVg49qcMrG33imb1t1h70EcDiIvqcsuhRYtiYeLcqcA
         5x5Aj2ws6dbCmI9FLcwiEjNzIGqbYOHNGaSUjbbLBIzQOaDhzn/nN/MfXhk0QsEyaXvW
         WUVQ==
X-Gm-Message-State: AOAM5300ETYdqF7Qml/im2uiZMvB1bIg3lUCggwRo4k46go0DbZFAPzL
        etOeK0ABjaPNHTuyWREaTA==
X-Google-Smtp-Source: ABdhPJy/HBKh7vqWy3cKV2MqICEFzucVlBEHlS1spVkJgYlN8jqsSaZxNrI/zs2h1pu1ULZfV84rwg==
X-Received: by 2002:a05:6830:4028:: with SMTP id i8mr6664972ots.12.1633661179812;
        Thu, 07 Oct 2021 19:46:19 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id r25sm231482ooq.43.2021.10.07.19.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 19:46:19 -0700 (PDT)
Received: (nullmailer pid 1409596 invoked by uid 1000);
        Fri, 08 Oct 2021 02:46:12 -0000
From:   Rob Herring <robh@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Simon Horman <horms+renesas@verge.net.au>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        Suman Anna <s-anna@ti.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org
In-Reply-To: <20211007124858.44011-4-tony@atomide.com>
References: <20211007124858.44011-1-tony@atomide.com> <20211007124858.44011-4-tony@atomide.com>
Subject: Re: [PATCH 3/3] dt-bindings: bus: ti-sysc: Update to use yaml binding
Date:   Thu, 07 Oct 2021 21:46:12 -0500
Message-Id: <1633661172.611522.1409595.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 07 Oct 2021 15:48:58 +0300, Tony Lindgren wrote:
> Update the binding for ti-sysc interconnect target module driver to yaml
> format.
> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: Suman Anna <s-anna@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  .../devicetree/bindings/bus/ti-sysc.txt       | 139 ----------------
>  .../devicetree/bindings/bus/ti-sysc.yaml      | 150 ++++++++++++++++++
>  2 files changed, 150 insertions(+), 139 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/bus/ti-sysc.txt
>  create mode 100644 Documentation/devicetree/bindings/bus/ti-sysc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/bus/ti-sysc.yaml:36:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/bus/ti-sysc.yaml:55:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1537683

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

