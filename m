Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 428A638B769
	for <lists+linux-omap@lfdr.de>; Thu, 20 May 2021 21:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237484AbhETTX3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 20 May 2021 15:23:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:49140 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236838AbhETTX2 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 20 May 2021 15:23:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 157956105A;
        Thu, 20 May 2021 19:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621538527;
        bh=pGj2m21Rr+RedlO3zLbZQ5wKNm5upkIVwCyZCTL3B9k=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=DR8vXQti4Bohj4xOM6/m2X1atmGoljVVLkFdIBBK5fZXIpPyGtMc39lKURvUPueaj
         dJvjy+/kkXeeccvCa3WIw47WoTPLXne8CArTSUtHWrPvsK97xgRsnvmddBlWd+89LB
         k/hWLmf7jAbshtEjLwUy7Vo92ZKvuF6fTHUGNS4XlBruDC81g4LCUJxqVDZMLUOFQB
         2naTIhBbey/krvwRiL3c6X4muxpNNKhPN5e5oiWG6JmQF5J2E5ORqZnoU6jRApANjt
         I8p2VorD9UgSyKYQmVVU23BvWNbOa/8hM0cwpjpG6oX+lvB8EDGK8ubXDOo9cNn91T
         dqeccufeGsabg==
Received: by mail-ej1-f49.google.com with SMTP id u21so26963288ejo.13;
        Thu, 20 May 2021 12:22:06 -0700 (PDT)
X-Gm-Message-State: AOAM530E1UJY2DnRWvpW+yntaXlw1+ubIEnfz+R8K5YiJlXKNKS3+XJ5
        DKJPB7l/xPmW1CoRTsDdF072ovBQrmMpqNYxoQ==
X-Google-Smtp-Source: ABdhPJxUYGX9fGlR21dCfAS6UFpl3PZ3Xg3sofjrWFaR6sA8n+7gw/W9/kl0GkjNISyhZAYmu+po9iwLSFeAtV5X/08=
X-Received: by 2002:a17:907:76e8:: with SMTP id kg8mr5885360ejc.130.1621538525633;
 Thu, 20 May 2021 12:22:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210518172022.10562-1-s-anna@ti.com> <c666919f-cc10-3ca5-a1e3-5062c260e827@ti.com>
 <20210520000831.GA3927464@robh.at.kernel.org> <f60764c8-9100-0c8d-96d6-76689ed8acc6@ti.com>
In-Reply-To: <f60764c8-9100-0c8d-96d6-76689ed8acc6@ti.com>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 20 May 2021 14:21:54 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLxmGHK_AEdth3M7Uhw4+A+2wNTzw_j74tRLjfp6z+UXg@mail.gmail.com>
Message-ID: <CAL_JsqLxmGHK_AEdth3M7Uhw4+A+2wNTzw_j74tRLjfp6z+UXg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mailbox: Convert omap-mailbox.txt binding to YAML
To:     Suman Anna <s-anna@ti.com>
Cc:     Jassi Brar <jaswinder.singh@linaro.org>,
        Tony Lindgren <tony@atomide.com>, Nishanth Menon <nm@ti.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        devicetree@vger.kernel.org,
        linux-omap <linux-omap@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, May 20, 2021 at 11:45 AM Suman Anna <s-anna@ti.com> wrote:
>
> On 5/19/21 7:08 PM, Rob Herring wrote:
> > On Wed, May 19, 2021 at 10:14:14AM -0500, Suman Anna wrote:
> >> On 5/18/21 12:20 PM, Suman Anna wrote:
> >>> Convert the current OMAP Mailbox binding from text format to YAML
> >>> format/DT schema, and delete the legacy text binding file.
> >>>
> >>> The new YAML binding conversion is an updated version compared to
> >>> the original. The descriptions for certain properties have been
> >>> improved to provide more clarity. Constraints are added to the
> >>> properties 'ti,mbox-num-users', 'ti,mbox-num-fifos' and 'interrupts'.
> >>> The 'ti,hwmods' is a legacy property and is retained only to reflect
> >>> the existing usage on some older OMAP2 and OMAP3 platforms.
> >>>
> >>> All the existing examples have also been updated to reflect the
> >>> latest dts nodes (ti,hwmods removed from OMAP4 and AM33xx examples,
> >>> and interrupts value updated for AM65x SoCs).
> >>>
> >>> Signed-off-by: Suman Anna <s-anna@ti.com>
> >>> ---
> >>> Hi,
> >>>
> >>> This patch does fix a number of dtbs_check warnings seen around OMAP Mailbox
> >>> nodes with the latest kernel. There are few left-over warnings when just
> >>> this patch is used on v5.13-rc1 or next-20210518. I have posted a separate
> >>> fix for a warning on TI K3 SoCs [1], and will be posting a separate cleanup
> >>> series for OMAP2+ SoCs. The dts patches can be picked up independently
> >>> of this patch.
> >>
> >> FYI, All the dtbs_check warnings will be gone with [1] and the OMAP2+ cleanup
> >> series [2].
> >
> > Nice, though it is a moving target. :) Is that still true with the
> > undocumented compatible checks that's been added?
>
> [1] is acked, so will definitely get picked up for the next merge window. Should
> hit next sometime in the next couple of days.
>
> I didn't exactly understand your second comment, but no new compatibles were
> added. The existing nodes are already in compliance with the constraints I added
> (so that's strictly binding enforcements). These constraints are almost all on
> legacy SoCs, so these do not pose any issues.

When you say 'All the dtbs_check warnings', you mean *all* or just all
the mailbox ones. I read as the former, but I guess from the prior
paragraph and the links you are talking about, it's just mailbox
warnings.

Overall, this is what TI 32-bit warnings look like:

Processing (am3|am4|am5|dra|keystone|omap|compulab|logicpd|elpida|motorola-cpcap|twl|da|dm):
warnings: 60358
undocumented compat: 3195

This comes from my CI job[1]. The warnings aren't deduplicated, so 1
SoC warning expands to N board warnings. Only 3879 unique warnings. :)

The top warnings are:

arch/arm/boot/dts/(am3|am4|am5|dra|keystone|omap|compulab|logicpd|elpida|motorola-cpcap|twl|da|dm):60358:3879:3195
    253  segment@0: 'anyOf' conditional failed, one must be fixed:
    253  segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
    140  segment@200000: 'anyOf' conditional failed, one must be fixed:
    140  segment@200000: $nodename:0: 'segment@200000' does not match
'^bus(@[0-9a-f]+)?$'
    128 0:0: /ocp/target-module@56000000: failed to match any schema
with compatible: ['ti,sysc-omap4', 'ti,sysc']
    128 0:0: /ocp/target-module@50000000: failed to match any schema
with compatible: ['ti,sysc-omap2', 'ti,sysc']
    128 0:0: /ocp/interconnect@48000000/segment@0/target-module@60000:
failed to match any schema with compatible: ['ti,sysc-omap2',
'ti,sysc']
    114 0:0: /ocp@68000000/target-module@49032000: failed to match any
schema with compatible: ['ti,sysc-omap2-timer', 'ti,sysc']
    114 0:0: /ocp@68000000/target-module@48320000: failed to match any
schema with compatible: ['ti,sysc-omap2', 'ti,sysc']
    114 0:0: /ocp@68000000/target-module@48318000: failed to match any
schema with compatible: ['ti,sysc-omap2-timer', 'ti,sysc']
    114 0:0: /ocp@68000000/target-module@48304000: failed to match any
schema with compatible: ['ti,sysc-omap2-timer', 'ti,sysc']
    114 0:0: /ocp@68000000/target-module@480a0000: failed to match any
schema with compatible: ['ti,sysc-omap2', 'ti,sysc']
    114 0:0: /ocp@68000000/target-module@48056000: failed to match any
schema with compatible: ['ti,sysc-omap2', 'ti,sysc']
    114 0:0: /ocp@68000000/l4@48000000/scm@2000/scm_conf@270/pbias_regulator@2b0:
failed to match any schema with compatible: ['ti,pbias-omap3',
'ti,pbias-omap']
    114 0:0: /ocp@68000000/l4@48000000/scm@2000/pinmux@a00: failed to
match any schema with compatible: ['ti,omap3-padconf',
'pinctrl-single']
    114 0:0: /ocp@68000000/l4@48000000/scm@2000/pinmux@30: failed to
match any schema with compatible: ['ti,omap3-padconf',
'pinctrl-single']
    112 0:0: /opp-table: failed to match any schema with compatible:
['operating-points-v2-ti-cpu']
    111  segment@100000: 'anyOf' conditional failed, one must be fixed:
    111  segment@100000: $nodename:0: 'segment@100000' does not match
'^bus(@[0-9a-f]+)?$'
    108 0:0: /soc: failed to match any schema with compatible: ['ti,omap-infra']

Rob

[1] https://gitlab.com/robherring/linux-dt/-/jobs/1261951514
