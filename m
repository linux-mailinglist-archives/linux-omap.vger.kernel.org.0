Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB93D3FEF60
	for <lists+linux-omap@lfdr.de>; Thu,  2 Sep 2021 16:21:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345379AbhIBOWp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Sep 2021 10:22:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:40862 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234283AbhIBOWn (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 2 Sep 2021 10:22:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3F3C3610A4;
        Thu,  2 Sep 2021 14:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630592505;
        bh=sUsA0gFbABycvbiHzVJiJQ+UzKuwYnPW95lbREpcEWw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=XANpgNcQspq5z8PetoCzgkEbmqNZk7yTrPFnmupbUnt9JFfFxRDbj7QpyT5IxnI0j
         XdWYsC7EEEbB9lE8GPjnQ+N9CizsW0oGNvdnQCJwwCAlD7UlgaJV8jmWETXD+NyyqI
         vMGZrUwujYY4diEYs8O3EqqtCVQPEqlwz1oKinBswVYMbbSnw2NtFm0YKOqyGDAty5
         BZI98ASpP55dAZ7NhkHQp5ofmZ1wn/BOC1+2ff8DrGLGPuCdOulNCbr/khiY8WTs1x
         OA08OZrDB3Zlrz1C8/wuJzSRLXZD4jH2Ht9zWlT+j59bs7KpqFWBOWGIXTkFGC7gIt
         4oT6bdu3WSBOQ==
Subject: Re: [PATCH v2 2/6] dt-bindings: memory-controllers: ti,gpmc: Convert
 to yaml
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, nm@ti.com,
        linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
        lokeshvutla@ti.com, robh+dt@kernel.org,
        krzysztof.kozlowski@canonical.com, miquel.raynal@bootlin.com,
        tony@atomide.com, linux-kernel@vger.kernel.org
References: <20210902095609.16583-1-rogerq@kernel.org>
 <20210902095609.16583-3-rogerq@kernel.org>
 <1630584239.117607.685604.nullmailer@robh.at.kernel.org>
From:   Roger Quadros <rogerq@kernel.org>
Message-ID: <d6b5a2b3-6a29-0c5d-cbe5-eda9b07b2c65@kernel.org>
Date:   Thu, 2 Sep 2021 17:21:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1630584239.117607.685604.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Rob,

On 02/09/2021 15:03, Rob Herring wrote:
> On Thu, 02 Sep 2021 12:56:05 +0300, Roger Quadros wrote:
>> Convert omap-gpmc.txt to ti,gpmc.yaml.
>>
>> Signed-off-by: Roger Quadros <rogerq@kernel.org>
>> ---
>>  .../bindings/memory-controllers/omap-gpmc.txt | 157 --------
>>  .../bindings/memory-controllers/ti,gpmc.yaml  | 364 ++++++++++++++++++
>>  .../devicetree/bindings/mtd/gpmc-nand.txt     |   2 +-
>>  .../devicetree/bindings/mtd/gpmc-nor.txt      |   4 +-
>>  .../devicetree/bindings/mtd/gpmc-onenand.txt  |   2 +-
>>  .../devicetree/bindings/net/gpmc-eth.txt      |   4 +-
>>  6 files changed, 370 insertions(+), 163 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
>>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/memory-controllers/ti,gpmc.example.dt.yaml:0:0: /example-0/memory-controller@50000000/nand@0,0: failed to match any schema with compatible: ['ti,omap2-nand']

'ti,omap2-nand' compatible is being added in patch 3 of this series.
So the error will go away there.

cheers,
-roger

> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/patch/1523568
> 
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
> 
