Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E00E4E0874
	for <lists+linux-omap@lfdr.de>; Tue, 22 Oct 2019 18:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731217AbfJVQOx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Oct 2019 12:14:53 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:8306 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727152AbfJVQOx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 22 Oct 2019 12:14:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1571760888;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=C/uw8S92wjbyOWAQk7FQIkAayZ1BGrYlPAf9Oil9cRE=;
        b=RSlOVsMAKP+L4nrbSHSrhU929PHeQUT//CQJ+9C51i3Dz/Jh7rLQZztbC537hKGuy+
        Cb6DN0zE4qmRv15P5OSTipmp+CqbvQLZ443H98Fs+8ybaboVdNUQC71StoxufuqwDTnM
        JyjnZy0s/RP2C/Tc/yL44uJ+lkT3gR2eZj6SKkKg79OX6KqM/lqIn96iJK/fr1h5r4mJ
        HfhW4yjYSlwdw2m85pL6O/eVUGCpXOOkIq6DfPKBixLQ9adpGbicBXBeY8mq7B22TXF8
        XcQ9I3KsO6e5IjEgjCUY78AVU4ahe7yqrNuA7LTj0wJ7JH+2fcAA9Zie3kO+KTU4yyaQ
        3RlQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/zswDWtng=="
X-RZG-CLASS-ID: mo00
Received: from mbp-13-nikolaus.fritz.box
        by smtp.strato.de (RZmta 44.28.1 DYNA|AUTH)
        with ESMTPSA id R0b2a8v9MGEcRpL
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Tue, 22 Oct 2019 18:14:38 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH 1/7] dt-bindings: gpu: pvrsgx: add initial bindings
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20191022153650.GL5610@atomide.com>
Date:   Tue, 22 Oct 2019 18:14:38 +0200
Cc:     Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com
Content-Transfer-Encoding: 7bit
Message-Id: <8FCDC0F6-7734-4629-9646-7BEED89FEF25@goldelico.com>
References: <cover.1571424390.git.hns@goldelico.com> <f0fb68dc7bc027e5e911721852f6bc6fa2d77a63.1571424390.git.hns@goldelico.com> <CAL_Jsq+obsTSU3iP1wm_3-FsAJ4Mxiz0NbMY1_h5NeFn67Sj+A@mail.gmail.com> <CEA29A3B-4116-4FE3-8E18-0C97353688DC@goldelico.com> <20191021172557.GB5610@atomide.com> <C6CD5A50-7F0A-4F56-ABB9-CAEDF7E47A5D@goldelico.com> <20191022150202.GJ5610@atomide.com> <CC62CE92-28DF-406E-B61C-22F8F341AAFB@goldelico.com> <20191022153650.GL5610@atomide.com>
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 22.10.2019 um 17:36 schrieb Tony Lindgren <tony@atomide.com>:
> 
> * H. Nikolaus Schaller <hns@goldelico.com> [191022 15:12]:
>> Hm. How should that work? Some SoC have the sgx544 as single
>> core and others as dual core. This imho does not fit into
>> the "img,sgx544-$revision" scheme which could be matched to.
> 
> Well don't you have then just two separate child nodes,
> one for each core with their own register range?

Doesn't look so. AFAIK the architecture of SGX is that there
is a single scheduler which is accessed by the register range
and it internally has control over multiple cores.

> 
> That is assuming they're really separate instances..

No. There is some internal magic in the driver. It just
needs to know that there is one or two nodes. Currently
this is handled by some #define option when calling the
inner Makefile.

My idea was to replace the #ifdef by checking for the
img,cores property.

> 
>> But maybe we do it the same as with the timer for the moment,
>> i.e. keep it in some unpublished patch set.
> 
> Yeah makes sense to me until things get sorted out.
> 
>> At the moment I have more problems understanding how the yaml
>> thing works. I understand and fully support the overall goal,
>> but it is quite difficult to get a start here. And there do not
>> seem to be tools or scripts to help converting from old style
>> text format (even if not perfect, this would be helpful) and
>> I have no yaml editor that helps keeping the indentation
>> correct. So this slows down a v2 a little bit.
> 
> Sounds handy to me :)
> 
> Regards,
> 
> Tony

