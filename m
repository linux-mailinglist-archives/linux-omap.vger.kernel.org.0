Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7CE54F90C3
	for <lists+linux-omap@lfdr.de>; Fri,  8 Apr 2022 10:28:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231757AbiDHIaL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 8 Apr 2022 04:30:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231760AbiDHIaK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 8 Apr 2022 04:30:10 -0400
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B85929EE2D;
        Fri,  8 Apr 2022 01:28:07 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2388Rw0A128418;
        Fri, 8 Apr 2022 03:27:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1649406478;
        bh=2HDzjxil59aCwsm7fYoHlyTAjnrcOPkH946EmkW9CCA=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=qJgMeFX+VE8mrlRFrdm8bo1okC1kEF3PSnazKGHZhLdNL2tZtanriss93HodkNTy9
         AMGX6SEyDJ7muQtjXpB8v31gubvbF0WhAUFBXzbco8apiQcr7pZd1kMKYT8RmbcKvl
         uzYkMwSYAtIjkZxv+7c87gif3kRDbaQxltAZqyQs=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2388RvpT062069
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 8 Apr 2022 03:27:58 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 8
 Apr 2022 03:27:57 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 8 Apr 2022 03:27:57 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2388RvkN034940;
        Fri, 8 Apr 2022 03:27:57 -0500
Date:   Fri, 8 Apr 2022 03:27:57 -0500
From:   Nishanth Menon <nm@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Keerthy <j-keerthy@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] dt-bindings: timer: Update TI timer to yaml and add
 compatible for am6
Message-ID: <20220408082757.3cnhvekpty4o4j2k@ladder>
References: <20220408081258.57213-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220408081258.57213-1-tony@atomide.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 11:12-20220408, Tony Lindgren wrote:
[...]

> +  ti,hwmods:
> +    description:
> +      Name of the HWMOD associated with timer. This is for legacy
> +      omap2/3 platforms only.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    deprecated: true
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +

Should we strengthen the check like in 8250_omap.yaml - something to the
effect of:

if:
  properties:
    compatible:
      contains:
        enum:
          - ti,omap2420-timer
          - ti,omap3430-timer
          - ti,omap4430-timer

then:
  properties:
    ti,hwmods:
      items:
        - pattern: "^timer([1-9]+)$"

else:
  properties:
    ti,hwmods: false
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
