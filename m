Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB5BA783C7C
	for <lists+linux-omap@lfdr.de>; Tue, 22 Aug 2023 11:07:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234193AbjHVJHR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Aug 2023 05:07:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234192AbjHVJHR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 22 Aug 2023 05:07:17 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80AFA189
        for <linux-omap@vger.kernel.org>; Tue, 22 Aug 2023 02:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692695193;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zITVam9mib7MXNblWRDDnWwcdZNI0hXQ9sYLmaBnbrA=;
        b=JyWTJ9Dz0p0ux2OZQZKRzphEH6HByHiZ3Ub+yiCufigxFwfw0je6DrRmXvd8DXaRA2bljb
        Ku5DCTIyyMM/p1PPC7M5LyLjfy6Q6hWej2talwtGh4gRdvcPMJhRGpOocTEVHmkjwyPWFr
        zcbSROCJGD9RpEeROX0lWBtYL9aPyHg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-227-NqhkzlFSMfynAemfj0DBvw-1; Tue, 22 Aug 2023 05:06:32 -0400
X-MC-Unique: NqhkzlFSMfynAemfj0DBvw-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-523464082ffso576380a12.1
        for <linux-omap@vger.kernel.org>; Tue, 22 Aug 2023 02:06:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692695191; x=1693299991;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zITVam9mib7MXNblWRDDnWwcdZNI0hXQ9sYLmaBnbrA=;
        b=iktXjePPMvciEitf/c7+6fOvpS5BM8C+3liC+g4q71pCsSxVuC2P1WBtqwsw3IJtjK
         303FAF4CH9s4fPEeZoV2iHv8lMEklbnuxDn27ir16FfJhjXcSya5AXTSgS4gKRybN9pR
         /TVWoPnhjVfTPbHbAh4NwVsKrZIqPD+Je/Fvh1d+RhtxIjINL7uXk3mwucBnJg8FF+4v
         W5aJAfCwstE0p6GJDnoUIVpStYtDFkADKH3OvoRZKJBCeYJLNy0JnMLHw8O+4RnXULNY
         XFu+lYwIGNsgbcliTjbh7Ww9i5pg6bpyW3X4bhzN+tu5LSXX7q88xhd6cZHys8makbec
         Kf6A==
X-Gm-Message-State: AOJu0YyYA7LPUXzfpMX2eShsRGyIbQuEB8STGRxnBnRQuPXjgODqadSu
        AYeew2DvTXNaejmiQx1DE548VpFeqVLWJL0xVaHOa1Cc2Fkw82yBccuuXt7mZ+MQn/isgR7u+t5
        YeqC+/RVa4z9oe1TDoljkbQ==
X-Received: by 2002:a05:6402:1d4c:b0:51e:5dd8:fc59 with SMTP id dz12-20020a0564021d4c00b0051e5dd8fc59mr7217540edb.1.1692695191299;
        Tue, 22 Aug 2023 02:06:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfZmPyXgiJ/NkAWWGBQMgHJy5FIu7B+DH5lu1nGvadCAiFsyleJ/rv4GEtyfZ7KoxM594bRw==
X-Received: by 2002:a05:6402:1d4c:b0:51e:5dd8:fc59 with SMTP id dz12-20020a0564021d4c00b0051e5dd8fc59mr7217526edb.1.1692695191035;
        Tue, 22 Aug 2023 02:06:31 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-241-4.dyn.eolo.it. [146.241.241.4])
        by smtp.gmail.com with ESMTPSA id f4-20020a05640214c400b00528922bb53bsm675146edx.76.2023.08.22.02.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 02:06:30 -0700 (PDT)
Message-ID: <4e79fe7d5363e69ed116f440db162dcb41b54ecc.camel@redhat.com>
Subject: Re: [PATCH v5 2/5] dt-bindings: net: Add IEP property in ICSSG DT
 binding
From:   Paolo Abeni <pabeni@redhat.com>
To:     MD Danish Anwar <danishanwar@ti.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Roger Quadros <rogerq@kernel.org>,
        Simon Horman <simon.horman@corigine.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Richard Cochran <richardcochran@gmail.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Eric Dumazet <edumazet@google.com>,
        "David S. Miller" <davem@davemloft.net>
Cc:     nm@ti.com, srk@ti.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date:   Tue, 22 Aug 2023 11:06:28 +0200
In-Reply-To: <20230817114527.1585631-3-danishanwar@ti.com>
References: <20230817114527.1585631-1-danishanwar@ti.com>
         <20230817114527.1585631-3-danishanwar@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 2023-08-17 at 17:15 +0530, MD Danish Anwar wrote:
> Add IEP node in ICSSG driver DT binding document.
>=20
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> ---
>  Documentation/devicetree/bindings/net/ti,icssg-prueth.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/net/ti,icssg-prueth.yaml b=
/Documentation/devicetree/bindings/net/ti,icssg-prueth.yaml
> index 8ec30b3eb760..a736d1424ea4 100644
> --- a/Documentation/devicetree/bindings/net/ti,icssg-prueth.yaml
> +++ b/Documentation/devicetree/bindings/net/ti,icssg-prueth.yaml
> @@ -52,6 +52,12 @@ properties:
>      description:
>        phandle to MII_RT module's syscon regmap
> =20
> +  ti,iep:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    maxItems: 2
> +    description:
> +      phandle to IEP (Industrial Ethernet Peripheral) for ICSSG driver

It looks like the feedback given by Rob on v2:

https://lore.kernel.org/all/20230821160120.GA1734560-robh@kernel.org/

still applies here, I guess you need to address it.

Cheers,

Paolo

--
pw-bot: cr

