Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B33CE3B202D
	for <lists+linux-omap@lfdr.de>; Wed, 23 Jun 2021 20:21:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbhFWSXw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 23 Jun 2021 14:23:52 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:42978 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbhFWSXw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 23 Jun 2021 14:23:52 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15NILQSj119060;
        Wed, 23 Jun 2021 13:21:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1624472486;
        bh=hLYAcMxY9DY3E5uC4uek5hnHy/5ivINIdWJSsLuzatQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=nb5Ym+RzBkjLNygomS9xENixS+gMR8Lh8JpaWCFVSIEjbtGqbZvPq8Pd5i2nWANxY
         Rd98V++L52dwaZ/5dMZ3Zz5KLWoO4fvT7Vsck/8R8xjl5Vc3RS83vcjW+rnsN5vaPP
         5eRuougIEld9JD9e7L61rw8GCX47EwuOznVlUvl4=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15NILQq6014324
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 23 Jun 2021 13:21:26 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 23
 Jun 2021 13:21:26 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 23 Jun 2021 13:21:26 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15NILMNC074937;
        Wed, 23 Jun 2021 13:21:23 -0500
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: pru: Update bindings for K3
 AM64x SoCs
To:     Suman Anna <s-anna@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Kishon Vijay Abraham I <kishon@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20210623173243.7862-1-s-anna@ti.com>
 <20210623173243.7862-2-s-anna@ti.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <c382db4b-6cf9-9c0a-6d13-c86f386a5214@ti.com>
Date:   Wed, 23 Jun 2021 21:21:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210623173243.7862-2-s-anna@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 23/06/2021 20:32, Suman Anna wrote:
> The K3 AM64x SoCs have an ICSSG IP that is similar to the IP revisions
> used on K3 AM65x SR2.0 and J721E SoCs. The ICSSG IP on K3 AM64x SoCs
> have the same set of two PRU cores, two RTU cores and two auxiliary PRU
> cores called Transmit PRUs (Tx_PRUs). There are some minor differences
> surrounding the PRU cores like different Broadside RAM (BSRAM) sizes
> w.r.t AM65x SR1.0 SoCs.
> 
> Update the PRU remoteproc bindings for these PRU cores on AM64x SoCs.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
>   .../devicetree/bindings/remoteproc/ti,pru-rproc.yaml         | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml
> index 63071eef1632..4f8435d49a62 100644
> --- a/Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml
> @@ -44,6 +44,9 @@ properties:
>         - ti,j721e-pru    # for PRUs in K3 J721E SoC family
>         - ti,j721e-rtu    # for RTUs in K3 J721E SoC family
>         - ti,j721e-tx-pru # for Tx_PRUs in K3 J721E SoC family
> +      - ti,am642-pru    # for PRUs in K3 AM64x SoC family
> +      - ti,am642-rtu    # for RTUs in K3 AM64x SoC family
> +      - ti,am642-tx-pru # for Tx_PRUs in K3 AM64x SoC family
>   
>     reg:
>       items:
> @@ -68,6 +71,7 @@ if:
>         enum:
>           - ti,am654-rtu
>           - ti,j721e-rtu
> +        - ti,am642-rtu
>   then:
>     properties:
>       $nodename:
> @@ -79,6 +83,7 @@ else:
>           enum:
>             - ti,am654-tx-pru
>             - ti,j721e-tx-pru
> +          - ti,am642-tx-pru
>     then:
>       properties:
>         $nodename:
> 

Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>

-- 
Best regards,
grygorii
