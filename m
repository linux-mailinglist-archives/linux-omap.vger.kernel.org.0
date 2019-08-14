Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91D1A8E028
	for <lists+linux-omap@lfdr.de>; Wed, 14 Aug 2019 23:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727750AbfHNVuU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Aug 2019 17:50:20 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:38536 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726934AbfHNVuU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 14 Aug 2019 17:50:20 -0400
Received: by mail-ed1-f66.google.com with SMTP id r12so539762edo.5
        for <linux-omap@vger.kernel.org>; Wed, 14 Aug 2019 14:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TQTbJak0HD1zlAgkHzMdLiqlYKkJ41upwnJP/xrZ5Ho=;
        b=cKYISp/W0fhCYcAgDO/gtmPiDJ1yy/mHMQx3U5vZaw1AUK2Y+OTU018u69fUicmMvw
         ZMxYRSMk+F4z3ZMIifDWcLhvvSKPN8Guoklni8cJweOVa103nwSHx+1Xf0ZpoSpxjeOf
         g54dV0HceNLWts1uLM8xe2WdZbv44kE1EENt8RcDv/a2dwmZVYwx1xXarmda/eSpPCDM
         jKAqQ3iN+7pU6ezkxA9DHoA3Xtayjda/TbW2fFM+iKCmG+Rq4fF9gKg+TB4EpgN1zSEh
         xQOuQ7uYShU4dDeKnS9mR60khwfcVFrmjzL5guZg5OpcIoPFZclERDo+UxB+uLXV6lDc
         +MOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TQTbJak0HD1zlAgkHzMdLiqlYKkJ41upwnJP/xrZ5Ho=;
        b=udo4dkRjxzyQDG4u55OZBmYc+Z69QqNbsuV88OmblZZ5ivZ/WoBqybGyAR2k9j7Kul
         bhcYlYFuEP6GX5Q8uxq2yPbWufR72JqPFH2gL9i3gO73SP6M4DUXRZjIEWrEZ6vgaIhk
         YYqsOazaLVdr5HTqEmIu4aExiH4HEmCZcpTydiYZAqzDZmU627F8yMTD+TEgSbd9JK+k
         YGrN7ylbgOsFMLtufP2Di0Qj3XNAcN+jNLQZqAj0sY+wOotypUswm6BfJ3zEKR/Gvdbv
         ywO5JSXDOE9ngxSB1TBhIyzDAMVdNz52cM1WSH1n8KNlrvQp4IuOebOjx2V7ZHnpv6nC
         ZIyg==
X-Gm-Message-State: APjAAAWrh9mTkfygfX+mSs0dU5e/jTFMtw3zaCsQ366X0TcFesTsm4DD
        li2HdKPe/prF99RvijKdlWbWgHx1
X-Google-Smtp-Source: APXvYqwWPzBj0dEjf1Y6ozOuQheRSQ+xAE04E4chJADyiNRlWEYzRaL78/hlSAAPqx3ukwfsW7NfvA==
X-Received: by 2002:a50:fa43:: with SMTP id c3mr1985353edq.94.1565819418618;
        Wed, 14 Aug 2019 14:50:18 -0700 (PDT)
Received: from lepton (46.137.104.92.dynamic.wline.res.cust.swisscom.ch. [92.104.137.46])
        by smtp.gmail.com with ESMTPSA id oh24sm105327ejb.35.2019.08.14.14.50.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Aug 2019 14:50:17 -0700 (PDT)
Date:   Wed, 14 Aug 2019 23:50:15 +0200
From:   =?UTF-8?B?QW5kcsOp?= Roth <neolynx@gmail.com>
To:     linux-omap@vger.kernel.org
Cc:     Tony Lindgren <tony@atomide.com>
Subject: Re: [RFC PATCH 0/3] Enable 1GHz support on omap36xx
Message-ID: <20190814235015.657ead35@lepton>
In-Reply-To: <20190813050826.GE52127@atomide.com>
References: <20190801012823.28730-1-neolynx@gmail.com>
        <20190813050826.GE52127@atomide.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


Hi all,

> Good to see some progress on this one :)

In the meanwhile I learned that just enabling the SmartReflex and
related components is not enough, as this would reduce the lifetime of
the chip. As explained here [1], an implementation of Dynamic voltage
and frequency scaling (DVFS) is needed.

I also talked to TI support, and was kindly provided an application
report document, detailing the usage of SmartReflex AVS. This document
is still under NDA, but there are changes this might be released
publicly soon, which would help implementing Linux support.

Kind Regards,

 André

[1] https://lkml.org/lkml/2014/1/29/446

