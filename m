Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAC1AAB0D4
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2019 05:04:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388526AbfIFDEr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Sep 2019 23:04:47 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:36528 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731518AbfIFDEr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Sep 2019 23:04:47 -0400
Received: by mail-pg1-f194.google.com with SMTP id l21so2624482pgm.3
        for <linux-omap@vger.kernel.org>; Thu, 05 Sep 2019 20:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3PTG9G99Umh/O+x7zai5y5HPdUR0mgJht59Vfjck7XQ=;
        b=JlDu4etbqmzw9wXT6FGlXJk4Kybmbh1/HwtZgLtvcc8JacahcRVrky+j2sG5rrZxqY
         ZuWEB7PpdtHHvjpRMr9Hpl8sE7EzzL40ASpLyvsnzjPjtGh9HtWndBXBMMuumMHcmkrj
         y0KB+73vEvTTP5yitiPrGNYRZ60cWlRbfyRqtgeV+0z91OL/2fNXYQCJC3JQpljqLY8T
         oRH7HWg5t/sLhnSxhen5EAdICh6nkloegeVwQg5oNeNOAmzqH9Mug+z3YdIUyu6ad2/f
         5CY1Fjq+vCZAP0hF0/29kPAvJgzAfXzscrMSgkKJo7qZK8vvAqDL5FuHlDH1/wHA8kp2
         EPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3PTG9G99Umh/O+x7zai5y5HPdUR0mgJht59Vfjck7XQ=;
        b=fIWMKkZIV3PHSdxoi8xp5tt6UF1ejosGAML+6Yi+pJEHUUJDczV6t7kd5oj7mWX3k1
         D06L9bEMb3ABOcLkYLfqN8oTHzqQf2htMUbVIdAk5HW+YZj1i/cbS2fpCsYP7a/rWY0/
         mRjxNyUtTzwY0mTCEmyeT3YL4+hW5qrJyetOEJwGqjNgc3onXax5c9El7tq6cm6UZUSa
         pZcFGoiWkGEEitSMBg8mDWL/03JlBInWlclMrc6htwdAMv/ZNuDDW6b6vjtazbMGQD/Z
         w7zSCfRiji7CaaptMB3e8z5Rr0EKZg9indem7h3Nh2RE68UT5mdMwRchX48yJlqGTwoB
         A6vQ==
X-Gm-Message-State: APjAAAVaF0dSDD+V4Tg6hJ6E/dC3rjjmKvX071o3D4j8lmcmIXp3n7Pm
        cSRn96EJmHU1/pFMtvpwNOj3aA==
X-Google-Smtp-Source: APXvYqwcU7P4KYdNJHTHBUa+PS5plDHub2NwjRt0YWUkZiqMjDWKH6/fIdJ8dd+tt9qVDv5mRdVbYw==
X-Received: by 2002:a65:5cca:: with SMTP id b10mr6247565pgt.365.1567739086676;
        Thu, 05 Sep 2019 20:04:46 -0700 (PDT)
Received: from localhost ([122.167.132.221])
        by smtp.gmail.com with ESMTPSA id e10sm4578936pfh.77.2019.09.05.20.04.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Sep 2019 20:04:46 -0700 (PDT)
Date:   Fri, 6 Sep 2019 08:34:44 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Adam Ford <aford173@gmail.com>,
        =?utf-8?B?QW5kcsOp?= Roth <neolynx@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        letux-kernel@openphoenux.org, kernel@pyra-handheld.com
Subject: Re: [RFC v2 1/3] cpufreq: ti-cpufreq: add support for omap34xx and
 omap36xx
Message-ID: <20190906030444.lklvvpbdqesatohb@vireshk-i7>
References: <cover.1567587220.git.hns@goldelico.com>
 <a889b10386bebfbfd6cdb5491367235290d53247.1567587220.git.hns@goldelico.com>
 <20190905143226.GW52127@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190905143226.GW52127@atomide.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 05-09-19, 07:32, Tony Lindgren wrote:
> Acked-by: Tony Lindgren <tony@atomide.com>

Do you want to pick the series instead as this has lots of DT changes
?

-- 
viresh
