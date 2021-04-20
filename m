Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D79B365E2F
	for <lists+linux-omap@lfdr.de>; Tue, 20 Apr 2021 19:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233086AbhDTRHM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 20 Apr 2021 13:07:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232769AbhDTRHM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 20 Apr 2021 13:07:12 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77501C06138A
        for <linux-omap@vger.kernel.org>; Tue, 20 Apr 2021 10:06:39 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id k26so21992507wrc.8
        for <linux-omap@vger.kernel.org>; Tue, 20 Apr 2021 10:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=w4puqZlCjEVgTM6gNpPaQUNAEdM5uE2S+cE3Q3nkYsc=;
        b=r8sXmNBiOSRBf34r6zlXlbaKlZty6hEdAKb9VgV5rjRXEsP+fwzI1NMDRDOGWjcy9b
         z9MPys5vSDQ9KFbbp28iuqeGSOGQp0TWgff3cHeQmdVvbMk1SCjef8TmDnAvK8OqxMNr
         iJTQNm7vzjFxfNoaAWHikcJ1dQuLE6ta+HaSrDSrA27NqD5tk8Nt6DFSW+W4il/QUqdY
         wFGuIA8lQ9CRODk8YVbyaeKrvPOELlI9FY+kWP/y2DmMBz20yHg61bkuKlPRn1PRHDek
         kfYq6ZRpvvSvJAdQPNouGRnl2aqGmieYf94//R876ZlaM2APNtkvXA/zFH2UuFzCL97z
         pzLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=w4puqZlCjEVgTM6gNpPaQUNAEdM5uE2S+cE3Q3nkYsc=;
        b=J3ZJi1jRcebaafs7ntGnz5GW3bKc828MlLcyQUlrocErBlk9QfhkPsdRAK5WPdIOdF
         dZw3qpyqfN6Bj1zBV+U8ratTGL944IJKIA9/93+IjCg8LgPsEK3oAktBkoE4BEFv4Sns
         peqgB1omEi6PgApT5HG5Q+6L4RknIPg+MhC7WGmF1PPg+JwyCT+gC0zBuvqMU/UrWIDl
         Aft0rczO/M1JM8R5dDy0Dkz/4GRF48hje3PMnNDVgpDd3PRTzIBU2/2dP+L4jNcM7hDN
         Z5djgFHxKgS0tuiL1hFt3aLJnPy13PC+uHwVc0U+dSTTdFvSFzMe+nFrcXYJC/R9f162
         A6fw==
X-Gm-Message-State: AOAM5332iRFU8zFEcGU3AEQ3DaZFq64OA++lgJjUs8i63jhqKVcPC+/V
        bOow/Pc1hBhYeuuCEgCVEmm5bw==
X-Google-Smtp-Source: ABdhPJwC4KWyM00E2bI8Fa/45JxKpliIW1TQwZbNPE5p/V99lkVz6F4RPTMzvDQKNEg4Uu7pkLiSAg==
X-Received: by 2002:adf:a40c:: with SMTP id d12mr21389263wra.91.1618938398032;
        Tue, 20 Apr 2021 10:06:38 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:a079:f96:da87:2d00? ([2a01:e34:ed2f:f020:a079:f96:da87:2d00])
        by smtp.googlemail.com with ESMTPSA id y125sm3916431wmc.40.2021.04.20.10.06.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Apr 2021 10:06:37 -0700 (PDT)
Subject: Re: [PATCH v2 1/1] thermal: ti-soc-thermal: Remove duplicated header
 file inclusion
To:     Zhen Lei <thunder.leizhen@huawei.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Keerthy <j-keerthy@ti.com>, Zhang Rui <rui.zhang@intel.com>,
        Amit Kucheria <amitk@kernel.org>,
        linux-pm <linux-pm@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <20210406091912.2583-1-thunder.leizhen@huawei.com>
 <20210406091912.2583-2-thunder.leizhen@huawei.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <f31ac615-fde6-f26b-5f97-479aaa638860@linaro.org>
Date:   Tue, 20 Apr 2021 19:06:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210406091912.2583-2-thunder.leizhen@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 06/04/2021 11:19, Zhen Lei wrote:
> Delete one of the header files <linux/of_device.h> that are included
> twice, all included header files are then rearranged alphabetically.

The duplicate header file inclusion has been already fixed in a previous
patch.

Applied this patch by massaging the changelog accordingly and fixing the
conflict.

Thanks

  -- Daniel

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
