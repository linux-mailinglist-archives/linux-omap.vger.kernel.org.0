Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6455052742
	for <lists+linux-omap@lfdr.de>; Tue, 25 Jun 2019 10:56:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730791AbfFYI4o (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 25 Jun 2019 04:56:44 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39574 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730905AbfFYI4o (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 25 Jun 2019 04:56:44 -0400
Received: by mail-wm1-f65.google.com with SMTP id z23so2054897wma.4
        for <linux-omap@vger.kernel.org>; Tue, 25 Jun 2019 01:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=O54HPskK78nRWjbEU9U57j8aKCfsNL7JehscZAlno5A=;
        b=SGdi2lfP9LNdabm3TNsJ3sK0YrDDDjwaEDyUcxVGiOvPEdiOfRe1qLn1YK/u/cdQK5
         +cCoahY+Hnwrmw3hvRUOaLj2sLzDGziRCP5T/cpfPfhbs6G2q8iBlsUjtbCTQKs2pLm8
         gmysgaamVadEcHrfCRQU5tzq3qSlF8ma3gdJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=O54HPskK78nRWjbEU9U57j8aKCfsNL7JehscZAlno5A=;
        b=K13t5Oaqpjhivivsd7K6KiF6T9BekmXOCK4vJaUU/ZhXRvEe6FUm6fE1D6ogOIE2zH
         2ciEYHSVPwnTBSZTfLSXWJVgIEzB/yQjqoeOTjelGq79U61Qd8M/0s3cqu7MoxiMHS+l
         vz+wmGOULwXTlxgEX08jllFlHVITEhLBmMJTGf3seNwudLtUV1NPIOnT45lWUF9uZHwP
         zG5P+QlYgTGqaNdBypccYTHwXUlHUZRRS/S+TniwejO5lLLHUtewwEhk8gtqNpAueQSP
         1tpsl2/57VtHod8buYC5E3WDY5dPpdJ5gOAaEm33sSq7bOB/aROzNKmYpgonHZS4RU2H
         STxA==
X-Gm-Message-State: APjAAAWKcGWGkkx5AnHgb5OkBnpCCyPO51NWxILIoNiJ4q9tG2i0dnkS
        4HsRmSmSoMRYS0l1W2/NwKWYHqmol8/W9BOth/Njc0gtxGKJdCjBcS6Io25O+8y8v9og7cmOj79
        S68fzCfbHX3AWO+9jf1Rq8DwGJIYiz5Tg6TqK2WtITIVvyDvWKRu9Wr0MOyLqCFhkOxYa44n5Jt
        cSD/ffyHxy
X-Google-Smtp-Source: APXvYqzmADKTXtLPyqX5Quh/j/9/3wLnmuCgRe+8tFU2rGMspNYo486PFBjI8H+mn2hDA4jliU+OMg==
X-Received: by 2002:a1c:e108:: with SMTP id y8mr18567373wmg.65.1561453001499;
        Tue, 25 Jun 2019 01:56:41 -0700 (PDT)
Received: from [10.176.68.244] ([192.19.248.250])
        by smtp.gmail.com with ESMTPSA id n3sm13039809wro.59.2019.06.25.01.56.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Jun 2019 01:56:40 -0700 (PDT)
Subject: Re: nl80211 wlcore regression in next
To:     Johannes Berg <johannes@sipsolutions.net>,
        Tony Lindgren <tony@atomide.com>
Cc:     Kalle Valo <kvalo@codeaurora.org>,
        Eyal Reizer <eyalreizer@gmail.com>,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org
References: <20190625073837.GG5447@atomide.com>
 <2570f4087d6e3356df34635a0380ec8ce06c9159.camel@sipsolutions.net>
 <20190625080019.GH5447@atomide.com>
 <7f74087fef1e554e0aeb82a6cec4113727487928.camel@sipsolutions.net>
From:   Arend Van Spriel <arend.vanspriel@broadcom.com>
Message-ID: <a863a74f-c6a9-b862-d17e-bc5f1dbe980a@broadcom.com>
Date:   Tue, 25 Jun 2019 10:56:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <7f74087fef1e554e0aeb82a6cec4113727487928.camel@sipsolutions.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 6/25/2019 10:02 AM, Johannes Berg wrote:
> On Tue, 2019-06-25 at 01:00 -0700, Tony Lindgren wrote:
>> Hi,
>>
>> * Johannes Berg <johannes@sipsolutions.net> [190625 07:47]:
>>> On Tue, 2019-06-25 at 00:38 -0700, Tony Lindgren wrote:
>>>> Hi,
>>>>
>>>> Looks like at least drivers/net/wireless/ti wlcore driver has stopped
>>>> working in Linux next with commit 901bb9891855 ("nl80211: require and
>>>> validate vendor command policy"). Reverting the commit above makes it
>>>> work again.
>>>>
>>>> It fails with the warning below, any ideas what goes wrong?
>>>
>>> Oops. For some reason, I neglected to check the vendor command usage
>>> beyond hwsim.
>>>
>>> The patch below should work?
>>
>> Yeah thanks that fixes the issue for me:
>>
>> Tested-by: Tony Lindgren <tony@atomide.com>
> 
> Thanks, I'll drop that into my tree and hopefully will remember to send
> it on soon.

Hi Johannes,

By chance noticed the patch included brcmfmac. So I tried, but I get 
compile issue below. It is because ERR_PTR really is an inline function 
so that is not working. So also need to patch that. I left the extra 
braces around the error code although not strictly necessary.

Regards,
Arend
---
diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 2d17e32..da8249b 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -4172,7 +4172,7 @@ struct sta_opmode_info {
         u8 rx_nss;
  };

-#define VENDOR_CMD_RAW_DATA ((const struct nla_policy *)ERR_PTR(-ENODATA))
+#define VENDOR_CMD_RAW_DATA ((const struct nla_policy *)(-ENODATA))

  /**
   * struct wiphy_vendor_command - vendor command definition


---8<--------------------------------------------------------------------
   CC [M]  drivers/net/wireless/broadcom/brcm80211/brcmfmac/vendor.o
In file included from 
drivers/net/wireless/broadcom/brcm80211/brcmfmac/vendor.c:18:0:
./include/net/cfg80211.h:4175:29: error: initializer element is not constant
  #define VENDOR_CMD_RAW_DATA ((const struct nla_policy *)ERR_PTR(-ENODATA))
                              ^
drivers/net/wireless/broadcom/brcm80211/brcmfmac/vendor.c:126:13: note: 
in expansion of macro \u2018VENDOR_CMD_RAW_DATA\u2019
    .policy = VENDOR_CMD_RAW_DATA,
              ^
./include/net/cfg80211.h:4175:29: note: (near initialization for 
\u2018brcmf_vendor_cmds[0].policy\u2019)
  #define VENDOR_CMD_RAW_DATA ((const struct nla_policy *)ERR_PTR(-ENODATA))
                              ^
drivers/net/wireless/broadcom/brcm80211/brcmfmac/vendor.c:126:13: note: 
in expansion of macro \u2018VENDOR_CMD_RAW_DATA\u2019
    .policy = VENDOR_CMD_RAW_DATA,
              ^
make[3]: *** [drivers/net/wireless/broadcom/brcm80211/brcmfmac/vendor.o] 
Error 1
