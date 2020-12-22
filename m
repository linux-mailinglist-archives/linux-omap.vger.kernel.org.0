Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E90D2E0CF5
	for <lists+linux-omap@lfdr.de>; Tue, 22 Dec 2020 17:00:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727202AbgLVP6g (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Dec 2020 10:58:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727176AbgLVP6g (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 22 Dec 2020 10:58:36 -0500
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD015C0613D6
        for <linux-omap@vger.kernel.org>; Tue, 22 Dec 2020 07:57:55 -0800 (PST)
Received: by mail-qk1-x72a.google.com with SMTP id v126so7742766qkd.11
        for <linux-omap@vger.kernel.org>; Tue, 22 Dec 2020 07:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tSbt+6uAU0/n70HJg2Z4UTZW3SPBYifyx/RQerMQRfc=;
        b=v7KC8FXXHyCRgKzSN1WdkZDILxNnZ3Tz50y2318GZEHFh2OgiVvbWtDas110A8j1bC
         bEUiYC07U4pNjkhq5tMD+838LcJrm+4obowXGjaHsc3RA+uiGe0rNYbBNCKn52aZEwnC
         BmcivK/TRVARKJegXMu8ZFzRsFfrV6Y7RPlm3CCXYLmXCCvVZPZII7ey3+RAXWnuHYkw
         VbEPi9Vqp1tuNwtjvV0bwxS+nhv1FE0yn+SLr/afAFKEWLTfcHUaQtvx/8wiFeBmYSxX
         ZjtuPMNqwpNZohmsmlH7kRYZXt9GF3YqcZAdXzrmFIEU9pwaL8VXAIbq3OJSqwbpIN0G
         E/IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tSbt+6uAU0/n70HJg2Z4UTZW3SPBYifyx/RQerMQRfc=;
        b=FB1ayNLUJIIDrN6bHavV/0HQgtqOHEqUgiUdehfTqy+We8Qtf2WfLUcXLuhoqmLvDb
         PzyrGvvg6p1kNZyE57X6R/AY5sKAtLkfpGqRNUK+reyjvnQgQygAl9Eoepo0Xp4quOxF
         KVD060i6Q+TqVaTXdlGkS7VUpFFpx9aDWhJQ7UXQ39zPCD0ABWiXZ1dRXNYJ5yW+LlJk
         OFG1WfGHaKyBxxVtb/6cbqr1tlI25vjZjd+8s6BEzbREBGlfEW4hmkToXWnlerJJP0H4
         L7gA4/7RaNlLQnUe6+6AFjQIBgyKsR0f79fnLv1CvBluWGmJ34xOeCWxh/WUDti18LsJ
         fTwQ==
X-Gm-Message-State: AOAM5310wMfAYOK+14wsQLILR84zHb+5lHgQ/YbULKlTqUI3QErJzhGm
        cuuxhrzjqNnHFP4K6iny2EGayei/PzB+zq+/wnc7ZA==
X-Google-Smtp-Source: ABdhPJyepNPHP4E52r1tz6fvELiPwmDt6Q5gFH4TExNWOuUpN0HYpkwqkhdR3ClOmYLtVmWMmX7T7ktkH+FPYq0fd1o=
X-Received: by 2002:a05:620a:12b9:: with SMTP id x25mr23021282qki.421.1608652674817;
 Tue, 22 Dec 2020 07:57:54 -0800 (PST)
MIME-Version: 1.0
References: <20201211142933.25784-1-grzegorz.jaszczyk@linaro.org>
 <20201211142933.25784-2-grzegorz.jaszczyk@linaro.org> <20201214225842.GA2537432@robh.at.kernel.org>
 <CAMxfBF65ve2Pk5Uz5V1V_LfOLFUFKebVE8bzSjLT0nonuH8TDg@mail.gmail.com> <CAL_JsqKpzZvdWJodzbqQBLZ-v98n3KaoTaYM-0iQ-_71hCbW8Q@mail.gmail.com>
In-Reply-To: <CAL_JsqKpzZvdWJodzbqQBLZ-v98n3KaoTaYM-0iQ-_71hCbW8Q@mail.gmail.com>
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Date:   Tue, 22 Dec 2020 16:57:43 +0100
Message-ID: <CAMxfBF5q2hjiYANZNtxz-PD=pR73EpXBpnWuB4dqXD1a=f2=gg@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: remoteproc: Add PRU consumer bindings
To:     Rob Herring <robh@kernel.org>
Cc:     Ohad Ben Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Anna, Suman" <s-anna@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "Bajjuri, Praneeth" <praneeth@ti.com>,
        Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Rob,

On Fri, 18 Dec 2020 at 23:51, Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Dec 16, 2020 at 9:55 AM Grzegorz Jaszczyk
> <grzegorz.jaszczyk@linaro.org> wrote:
> >
> > Hi Rob,
> >
> > On Mon, 14 Dec 2020 at 23:58, Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Fri, Dec 11, 2020 at 03:29:29PM +0100, Grzegorz Jaszczyk wrote:
> > > > From: Suman Anna <s-anna@ti.com>
> > > >
> > > > Add a YAML binding document for PRU consumers. The binding includes
> > > > all the common properties that can be used by different PRU consumer
> > > > or application nodes and supported by the PRU remoteproc driver.
> > > > These are used to configure the PRU hardware for specific user
> > > > applications.
> > > >
> > > > The application nodes themselves should define their own bindings.
> > > >
> > > > Co-developed-by: Tero Kristo <t-kristo@ti.com>
> > > > Signed-off-by: Tero Kristo <t-kristo@ti.com>
> > > > Signed-off-by: Suman Anna <s-anna@ti.com>
> > > > Co-developed-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> > > > Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> > > > ---
> > > >  .../bindings/remoteproc/ti,pru-consumer.yaml  | 64 +++++++++++++++++++
> > > >  1 file changed, 64 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml b/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
> > > > new file mode 100644
> > > > index 000000000000..2c5c5e2b6159
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
> > > > @@ -0,0 +1,64 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/remoteproc/ti,pru-consumer.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Common TI PRU Consumer Binding
> > > > +
> > > > +maintainers:
> > > > +  - Suman Anna <s-anna@ti.com>
> > > > +
> > > > +description: |
> > > > +  A PRU application/consumer/user node typically uses one or more PRU device
> > > > +  nodes to implement a PRU application/functionality. Each application/client
> > > > +  node would need a reference to at least a PRU node, and optionally define
> > > > +  some properties needed for hardware/firmware configuration. The below
> > > > +  properties are a list of common properties supported by the PRU remoteproc
> > > > +  infrastructure.
> > > > +
> > > > +  The application nodes shall define their own bindings like regular platform
> > > > +  devices, so below are in addition to each node's bindings.
> > > > +
> > > > +properties:
> > > > +  prus:
> > >
> > > ti,prus
> >
> > Thank you - I will change and post v2 but with this I will run into
> > issues when this binding will be referenced by some consumer YAML
> > binding. Running dtbs_check in such case throws:
> > ... k3-am654-base-board.dt.yaml: serial@28000: 'ti,prus' does not
> > match any of the regexes: 'pinctrl-[0-9]+'
> > In the same time if I will remove this property from that node I am getting:
> > ... k3-am654-base-board.dt.yaml: serial@28000: 'ti,prus' is a required property
> > as expected.
>
> Sounds like you didn't update 'ti,prus' in whatever schema you include
> this one from.
>
> >
> > Getting rid of the comma from this property name workarounds mentioned
> > problem (which is not proper but allows me to correctly test this
> > binding): e.g. s/ti,prus/ti-pruss/ or using the previous name without
> > a comma.
> > It seems to be an issue with dtbs_check itself which we will encounter
> > in the future.
>
> If not, can you point me to a branch having this problem.

Sure, here is temporary branch with 4 last commits demonstrating
mentioned issues (when property name contains comma):
https://git.linaro.org/people/grzegorz.jaszczyk/linux.git/log/?h=ti-pruss-binding-issue

The last commit gets rid of the comma from properties names which
successfully w/a the problem.

Please note that those are only TEMP commits which demonstrates the
mentioned issue. I've put error logs with some notes in commit log to
ease understanding what issues are seen when.

Thank you in advance,
Grzegorz
