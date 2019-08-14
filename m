Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD0C98CC4E
	for <lists+linux-omap@lfdr.de>; Wed, 14 Aug 2019 09:08:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727079AbfHNHIl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Aug 2019 03:08:41 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:46842 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726947AbfHNHIl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 14 Aug 2019 03:08:41 -0400
Received: by mail-pl1-f196.google.com with SMTP id c2so50311297plz.13
        for <linux-omap@vger.kernel.org>; Wed, 14 Aug 2019 00:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:cc:to:user-agent:date;
        bh=noA9l+lac2tFbODKUiemces22bFWF2XvyoUUU0oGh3Y=;
        b=azhHcHx6e2GPzq1qiXPKq9L0/FCy+3K5Ug+7kOM9qsxRMQvVJbQdk4B+sd9jPo1Wzm
         XUFDfEyv1O0gaQeTg8YERL8VT4vQRl44Lr844PzeDUfdP8nDuTFzs1GEGVxpExF3xus2
         JT3IsxKxLZ47NG/5vgeIDnHRAbxQfVqpGdkjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:cc:to
         :user-agent:date;
        bh=noA9l+lac2tFbODKUiemces22bFWF2XvyoUUU0oGh3Y=;
        b=jno2TX7tZ55xYS8LVH2StISlHNusOHDyzsKBn2pmyqlFZSM3kdZrR6SYGFJsEB7yWU
         cjWJ2v1mGZ93beZQ2BLPFeCHfHhkmXQj8osOwn/VqUL7rRqAiOU1ZFLXbFuOLaOAdPMB
         a8+0XRLNsOJxAt2xs1s4FNlTHbtpNOU9EER22q1Ke4w1Qt6+SpG5f1W6bGrYrTjGG8qo
         V6VUt7jzfRJ+5ks8ezZ1AI0HdgbFPKUr7SRr6RGT9k38/dT1o3CmMYKLEYwmnGsI0gAF
         9zjJei29cvqhnTY48PSdbe+50iGnhdqTROhi5tifdue30QknOXa6Ki/4+NarnzCxtdrq
         d4KQ==
X-Gm-Message-State: APjAAAV89LUZpqVXjWbzpnyjr3CWOwuiDaqw9ysuY9s+eN/wz8dtJ8m3
        PVptrhO8xgQsT2T+lpaGdERskqfRQemhcQ==
X-Google-Smtp-Source: APXvYqwhleD1WxLn9SQPb5TBxm/FmAKBDsfXxxHaV50lM2/VS0F8JJMyxYA9vP5R1sXtEGB5XR73nA==
X-Received: by 2002:a17:902:7612:: with SMTP id k18mr40585980pll.48.1565766520648;
        Wed, 14 Aug 2019 00:08:40 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id e6sm14135669pfl.37.2019.08.14.00.08.40
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 14 Aug 2019 00:08:40 -0700 (PDT)
Message-ID: <5d53b378.1c69fb81.31b2e.5077@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190814063803.GY52127@atomide.com>
References: <20190814063803.GY52127@atomide.com>
Subject: Re: Regression in Linux next with show wakeup sources stats in sysfs
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
To:     "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kalesh Singh <kaleshsingh@google.com>,
        Tony Lindgren <tony@atomide.com>, Tri Vo <trong@android.com>
User-Agent: alot/0.8.1
Date:   Wed, 14 Aug 2019 00:08:39 -0700
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tony Lindgren (2019-08-13 23:38:03)
> Hi all,
>=20
> Looks like commit 986845e747af ("PM / wakeup: Show wakeup sources stats
> in sysfs") has caused a regression in Linux next where I can now get
> some errors like this during the boot:
>=20
> kobject_add_internal failed for wakeup10 (error: -2 parent: usb)
>=20
> Any ideas why this might be happening? Maybe some deferred probe
> related issue?
>=20

Yeah! Take a look at this thread[1] and please test out patches I'm
throwing out there like a total cowboy(d).

[1] https://lkml.kernel.org/r/1565731976.8572.16.camel@lca.pw

