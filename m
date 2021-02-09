Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C46643154E3
	for <lists+linux-omap@lfdr.de>; Tue,  9 Feb 2021 18:20:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233051AbhBIRU1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 9 Feb 2021 12:20:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233023AbhBIRUX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 9 Feb 2021 12:20:23 -0500
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFDEBC061756
        for <linux-omap@vger.kernel.org>; Tue,  9 Feb 2021 09:19:43 -0800 (PST)
Received: by mail-oo1-xc2f.google.com with SMTP id 123so4410143ooi.13
        for <linux-omap@vger.kernel.org>; Tue, 09 Feb 2021 09:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=F3Bq4AlUrdrosw0AiiaEx5S72sFr2hrQxQwbM2DUyVM=;
        b=jF5KpzKj2SCQPLubuGJH4OLS0x8ZKXJ5PF9EbaYmUES2u4qDd3DCjM/6nCJ7D8BMAy
         or6pwP9IZVf3tzjdMaGZqT/4NceSqTNLY8UdephdzFzn9jwNlL0/8TuPMPWUU8+VSFfr
         bsEZqEfEmlArNO2sKerWObRG1l9uXiHjSptixq3ZzwdAqZpNHu2VSFOTDlfZCjGRfyzh
         RZJjlzjYz5STL02287Aks9TwnGE5y55ioKZHU+jvqY82qvVaApxeJk3xkxEUCbXJYlTX
         zc3gwK+tG3mA6e1q0/Cnfk4vlcD5tCKisJy1fSzM7EUPjA1BYBeEtJaGPsJ1ga7DQPiU
         6PCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=F3Bq4AlUrdrosw0AiiaEx5S72sFr2hrQxQwbM2DUyVM=;
        b=NuwIUvg4IDwHyjZ2TFQ7hywERs6kmVK70lF97MEjEZ4kgR+QCtFlPlSEPzt6GUIObz
         PC/sRYRWElrt34Q59HwwApjN3UfqHo7o2eXFVzjF06qr6/oU+lBI66NcKbprlYffu56q
         kjVqwN3xaoRgQPHHYxgjdTfYueaMSsuKceLT8z79eL7ZGIefuYJ1EjtdQTWWoxj/XX8V
         GbpAuzUtafuwEUPgEd40+r63RtVWkZy4tB2XeRq+DqmP+kBdKqWtZ+p4G5BZmgFqHYMR
         qlOpF61PR/ccfDaxFfqulSRRNdRdN7aIpmkUk+PmoY+7y6UUdaTF9RIFzhgrD3AVLn7P
         NmXA==
X-Gm-Message-State: AOAM532tZt0OqvJGJhnEJN7k4DnCV8sgPj/57OD7jx7SqinVjrJEGDki
        qgO6qwKzm7w1kPKzcTb1qBO0HA==
X-Google-Smtp-Source: ABdhPJzePQ1pKEKY1wfXkp3t+2w73TUAvt/dL+kKd60u3tlPQjDwvza13HVj2BAF6VL+H6EXphHMKQ==
X-Received: by 2002:a4a:e14f:: with SMTP id p15mr16587495oot.25.1612891182717;
        Tue, 09 Feb 2021 09:19:42 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z8sm4287543oon.10.2021.02.09.09.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 09:19:42 -0800 (PST)
Date:   Tue, 9 Feb 2021 11:19:40 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwlock: Update OMAP HwSpinlock binding
 for AM64x SoCs
Message-ID: <YCLELGkpWBPgud1Y@builder.lan>
References: <20210125235653.24385-1-s-anna@ti.com>
 <20210125235653.24385-2-s-anna@ti.com>
 <20210209170025.GA3927023@robh.at.kernel.org>
 <48f25fc0-5131-9821-d50d-7f4f7ef5815e@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48f25fc0-5131-9821-d50d-7f4f7ef5815e@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue 09 Feb 11:09 CST 2021, Suman Anna wrote:

> Hi Rob,
> 
> On 2/9/21 11:00 AM, Rob Herring wrote:
> > On Mon, Jan 25, 2021 at 05:56:52PM -0600, Suman Anna wrote:
> >> Update the existing OMAP HwSpinlock binding to include the info for
> >> AM64x SoCs. There are some minor IP integration differences between
> >> the AM64x SoCs and the previous AM65x and J721E SoC families. A new
> >> example is also added showcasing the difference in the IP's presence
> >> on the interconnect.
> >>
> >> Signed-off-by: Suman Anna <s-anna@ti.com>
> >> ---
> >>  .../bindings/hwlock/ti,omap-hwspinlock.yaml   | 26 +++++++++++++++++++
> >>  1 file changed, 26 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml
> >> index ac35491a6f65..ac146c0d628f 100644
> >> --- a/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml
> >> +++ b/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml
> >> @@ -14,6 +14,7 @@ properties:
> >>      enum:
> >>        - ti,omap4-hwspinlock  # for OMAP44xx, OMAP54xx, AM33xx, AM43xx, DRA7xx SoCs
> >>        - ti,am654-hwspinlock  # for K3 AM65x, J721E and J7200 SoCs
> >> +      - ti,am64-hwspinlock   # for K3 AM64x SoCs
> >>  
> >>    reg:
> >>      maxItems: 1
> >> @@ -74,3 +75,28 @@ examples:
> >>              };
> >>          };
> >>      };
> >> +
> >> +  - |
> >> +    / {
> >> +        /* K3 AM64x SoCs */
> >> +        model = "Texas Instruments K3 AM642 SoC";
> >> +        compatible = "ti,am642-evm", "ti,am642";
> >> +        #address-cells = <2>;
> >> +        #size-cells = <2>;
> >> +
> >> +        bus@f4000 {
> >> +            compatible = "simple-bus";
> >> +            #address-cells = <2>;
> >> +            #size-cells = <2>;
> >> +            ranges = <0x00 0x000f4000 0x00 0x000f4000 0x00 0x000002d0>, /* PINCTRL */
> >> +                     <0x00 0x01000000 0x00 0x01000000 0x00 0x02330400>, /* First peripheral window */
> >> +                     <0x00 0x0f000000 0x00 0x0f000000 0x00 0x00c44200>, /* Second peripheral window */
> >> +                     <0x00 0x20000000 0x00 0x20000000 0x00 0x0a008000>; /* Third peripheral window */
> >> +
> >> +            spinlock@2a000000 {
> > 
> > Why are you doing the whole hierarchy here? Don't do that.
> 
> I added it because it's integration is slightly different and to help our
> downstream consumers.
> 
> > 
> > In any case, a new compatible doesn't warrant a whole new example, so 
> > drop the example.
> 
> Yeah ok, will drop the example.
> 

I was just waiting for my build test to pass before pushing this and a
few other patches out, will drop the example from the patch here.  No
need to resend.

Thanks,
Bjorn

> regards
> Suman
> 
> > 
> >> +                compatible = "ti,am64-hwspinlock";
> >> +                reg = <0x00 0x2a000000 0x00 0x1000>;
> >> +                #hwlock-cells = <1>;
> >> +            };
> >> +        };
> >> +    };
> >> -- 
> >> 2.29.2
> >>
> 
